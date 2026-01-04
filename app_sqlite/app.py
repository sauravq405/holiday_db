import os
import logging
import re
import json
import sqlite3
from typing import List, Dict, Any, Optional

from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration
SQLITE_DB_PATH = os.getenv("SQLITE_DB_PATH", "holiday.db")
OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY")
OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions"
LLM_MODEL = "meta-llama/llama-3.3-70b-instruct:free"

# Logging setup
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI()

# Pydantic Models
class QueryRequest(BaseModel):
    question: str

class QueryResponse(BaseModel):
    sql: str
    row_count: int
    data: List[Dict[str, Any]]

class ErrorResponse(BaseModel):
    error: str

def get_db_connection():
    """Establishes a connection to the SQLite database."""
    try:
        # Assuming database is in the parent directory or same directory, typical setup
        # If running from app_sqlite folder, and db is in root, use ../holiday.db
        # But for safety we trust env var or relative path from CWD
        
        if not os.path.exists(SQLITE_DB_PATH):
           # Try looking in parent directory if not found in CWD
           parent_path = os.path.join("..", SQLITE_DB_PATH)
           if os.path.exists(parent_path):
               conn = sqlite3.connect(parent_path)
           else:
               logger.error(f"Database file not found at: {SQLITE_DB_PATH}")
               raise HTTPException(status_code=500, detail="Database file not found.")
        else:
            conn = sqlite3.connect(SQLITE_DB_PATH)
            
        conn.row_factory = sqlite3.Row # Allows accessing columns by name
        return conn
    except sqlite3.Error as e:
        logger.error(f"Failed to connect to SQLite database: {e}")
        raise HTTPException(status_code=500, detail="Database connection error.")

def generate_sql_from_llm(question: str) -> str:
    """
    Send the natural language question to the LLM and get a SQL query in return.
    """
    if not OPENROUTER_API_KEY:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, 
            detail="OpenRouter API key not configured."
        )

    prompt = f"""You are a SQLite expert. 
The available table is: national_holidays
Columns: holiday_id (INTEGER), holiday_name (TEXT), holiday_date (TEXT YYYY-MM-DD), holiday_year (INTEGER), day_of_week (TEXT), holiday_type (TEXT), state (TEXT), is_official (INTEGER 0/1), public_holiday (INTEGER 0/1).

Rules:
1. Convert the user question into a single safe SELECT query on national_holidays.
2. Return ONLY the SQL query. No markdown formatting, no explanations, no code blocks.
3. Do NOT use INSERT, UPDATE, DELETE, DROP, ALTER.
4. Do NOT use subqueries touching other tables.
5. Dates are stored as text strings in 'YYYY-MM-DD' format. Use string comparison for dates (e.g. holiday_date > '2026-01-01').
6. Use 'date(\'now\')' for current date if needed.

Sample Data (3 representative rows):
| holiday_id | holiday_name      | holiday_date | holiday_type           | state                                     | is_official | public_holiday |
|------------|-------------------|--------------|------------------------|-------------------------------------------|-------------|----------------|
| 24         | Republic Day      | '2026-01-26' | 'Public Holiday'       | 'National'                                | 1           | 1              |
| 11         | Bhogi             | '2026-01-14' | 'Regional Holiday'     | 'Andhra Pradesh / Telangana / Tamil Nadu' | 0           | 0              |
| 25         | Gothar Bathou Sun | '2026-01-27' | 'Not a Public Holiday' | 'Assam'                                   | 0           | 0              |

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
    forbidden = ["INSERT ", "UPDATE ", "DELETE ", "DROP ", "ALTER ", "TRUNCATE ", "GRANT ", "REVOKE ", "ATTACH ", "DETACH "]
    for word in forbidden:
        if word in sql_upper:
            raise HTTPException(status_code=400, detail=f"Unsafe SQL detected: contains {word.strip()}")

    # 2. Check that it starts with SELECT
    if not sql_upper.startswith("SELECT"):
        raise HTTPException(status_code=400, detail="Only SELECT queries are allowed.")

    # 3. Check table name presence (simple check)
    if "NATIONAL_HOLIDAYS" not in sql_upper:
        raise HTTPException(status_code=400, detail="Query must access the national_holidays table.")

def execute_query_safe(sql: str) -> List[Dict[str, Any]]:
    """
    Execute the SQL query against the SQLite database.
    """
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        logger.info(f"Executing SQL: {sql}")
        cursor.execute(sql)
        
        # SQLite row_factory=sqlite3.Row allows conversion to dict
        rows = cursor.fetchall()
        results = [dict(row) for row in rows]
            
        return results
        
    except sqlite3.Error as e:
        logger.error(f"Database error execution SQL: {e}")
        raise HTTPException(status_code=400, detail=f"Database error: {str(e)}")
    except Exception as e:
        logger.error(f"Unexpected error during execution: {e}")
        raise HTTPException(status_code=500, detail="Internal execution error.")
    finally:
        conn.close()

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
