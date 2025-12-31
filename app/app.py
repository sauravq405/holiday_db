import os
import logging
import re
import json
from contextlib import asynccontextmanager
from typing import List, Dict, Any, Optional

from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel
import oracledb
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration
# Secrets should be in environment variables
# Defaults provided for non-sensitive values based on prompt
ORACLE_USER = os.getenv("ORACLE_USER", "sdp")
ORACLE_PASSWORD = os.getenv("ORACLE_PASSWORD")  # Must be provided
ORACLE_DSN = os.getenv("ORACLE_DSN", "localhost:1522/FREEPDB1") 
OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY")
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"
LLM_MODEL = "meta-llama/llama-3.3-70b-instruct:free"

# Logging setup
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Global connection pool
pool = None

@asynccontextmanager
async def lifespan(app: FastAPI):
    """
    Manage the lifecycle of the application:
    - Initialize Oracle connection pool on startup
    - Close pool on shutdown
    """
    global pool
    try:
        logger.info("Initializing Oracle connection pool...")
        if not ORACLE_PASSWORD:
            logger.warning("ORACLE_PASSWORD not set in environment variables.")

        # Create the connection pool
        pool = oracledb.create_pool(
            user=ORACLE_USER,
            password=ORACLE_PASSWORD,
            dsn=ORACLE_DSN,
            min=1,
            max=5,
            increment=1
        )
        logger.info("Oracle connection pool created successfully.")
        yield
    except Exception as e:
        logger.error(f"Failed to initialize database pool: {e}")
        raise
    finally:
        if pool:
            logger.info("Closing Oracle connection pool...")
            pool.close()
            logger.info("Oracle connection pool closed.")

app = FastAPI(lifespan=lifespan)

# Pydantic Models
class QueryRequest(BaseModel):
    question: str

class QueryResponse(BaseModel):
    sql: str
    row_count: int
    data: List[Dict[str, Any]]

class ErrorResponse(BaseModel):
    error: str

def generate_sql_from_llm(question: str) -> str:
    """
    Send the natural language question to the LLM and get a SQL query in return.
    """
    if not OPENROUTER_API_KEY:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, 
            detail="OpenRouter API key not configured."
        )

    prompt = f"""You are an Oracle SQL expert.
The available table is: NATIONAL_HOLIDAYS
Columns: holiday_id, holiday_name, holiday_date, holiday_year, holiday_type, state, is_official, public_holiday.

Rules:
1. Convert the user question into a single safe SELECT query on NATIONAL_HOLIDAYS.
2. Return ONLY the SQL query. No markdown formatting, no explanations, no code blocks.
3. Do NOT use INSERT, UPDATE, DELETE, DROP, ALTER.
4. Do NOT use subqueries touching other tables.
5. Dates must be Oracle-compatible (e.g. TO_DATE if needed, or ANSI date literals).
6. Use bind variables is NOT required for this simple interface, direct values are accepted for read-only.

User Question: {question}
SQL:"""

    headers = {
        "Authorization": f"Bearer {OPENROUTER_API_KEY}",
        "Content-Type": "application/json"
    }
    
    payload = {
        "model": LLM_MODEL,
        "messages": [
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.1,
        "max_tokens": 500
    }

    try:
        response = requests.post(OPENROUTER_URL, headers=headers, json=payload, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        if "choices" in result and result["choices"]:
            content = result["choices"][0]["message"]["content"]
            # Clean up potential markdown code blocks if the LLM ignores instructions
            clean_sql = content.replace("```sql", "").replace("```", "").strip()
            return clean_sql
        else:
            logger.error(f"Unexpected LLM response format: {result}")
            raise HTTPException(status_code=500, detail="Failed to generate SQL from LLM.")
            
    except requests.RequestException as e:
        logger.error(f"LLM request failed: {e}")
        raise HTTPException(status_code=502, detail="Error communicating with LLM provider.")

def validate_sql(sql: str):
    """
    Basic safety validation for the generated SQL.
    """
    sql_upper = sql.upper()
    
    # 1. Check for forbidden keywords
    forbidden = ["INSERT ", "UPDATE ", "DELETE ", "DROP ", "ALTER ", "TRUNCATE ", "GRANT ", "REVOKE "]
    for word in forbidden:
        if word in sql_upper:
            raise HTTPException(status_code=400, detail=f"Unsafe SQL detected: contains {word.strip()}")

    # 2. Check that it starts with SELECT
    if not sql_upper.startswith("SELECT"):
        raise HTTPException(status_code=400, detail="Only SELECT queries are allowed.")

    # 3. Check table name presence (simple check)
    if "NATIONAL_HOLIDAYS" not in sql_upper:
        raise HTTPException(status_code=400, detail="Query must access the NATIONAL_HOLIDAYS table.")

def execute_query_safe(sql: str) -> List[Dict[str, Any]]:
    """
    Execute the SQL query against the Oracle database.
    """
    if not pool:
        raise HTTPException(status_code=500, detail="Database connection pool is not initialized.")
    
    conn = None
    try:
        conn = pool.acquire()
        cursor = conn.cursor()
        
        logger.info(f"Executing SQL: {sql}")
        cursor.execute(sql)
        
        # specific to oracledb: fetch results and map to dictionaries
        columns = [col[0].lower() for col in cursor.description]
        rows = cursor.fetchall()
        
        results = []
        for row in rows:
            results.append(dict(zip(columns, row)))
            
        return results
        
    except oracledb.Error as e:
        logger.error(f"Database error execution SQL: {e}")
        error_obj, = e.args
        raise HTTPException(status_code=400, detail=f"Database error: {error_obj.message}")
    except Exception as e:
        logger.error(f"Unexpected error during execution: {e}")
        raise HTTPException(status_code=500, detail="Internal execution error.")
    finally:
        if conn:
            pool.release(conn)

@app.post("/query", response_model=QueryResponse, responses={400: {"model": ErrorResponse}, 500: {"model": ErrorResponse}})
def query_endpoint(request: QueryRequest):
    """
    Process a natural language query.
    """
    question = request.question.strip()
    if not question:
        raise HTTPException(status_code=400, detail="Question cannot be empty.")
        
    # 1. Generate SQL
    sql = generate_sql_from_llm(question)
    
    # 2. Validate SQL
    validate_sql(sql)
    
    # 3. Execute SQL
    data = execute_query_safe(sql)
    
    return QueryResponse(
        sql=sql,
        row_count=len(data),
        data=data
    )

if __name__ == "__main__":
    import uvicorn
    # Using a factory or just running app directly 
    # reload=True is good for dev, strictly speaking production wouldn't use it but for this task it's fine
    uvicorn.run("app:app", host="0.0.0.0", port=8000, reload=False)
