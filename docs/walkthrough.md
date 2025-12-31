# Walkthrough - Oracle NL-to-SQL API

I have successfully created the Python API service that converts natural language questions into Oracle SQL.

## Changes Created

### [NEW] [requirements.txt](file:///d:/2025/workspaces/Git_holiday_db/holiday_db/requirements.txt)
Contains the necessary dependencies: `fastapi`, `oracledb`, `requests`, etc.

### [NEW] [app.py](file:///d:/2025/workspaces/Git_holiday_db/holiday_db/app.py)
The complete application logic, featuring:
- **FastAPI** application with startup/shutdown lifecycle events.
- **Oracle Connection Pool** using `oracledb` thin mode.
- **LLM Integration** via OpenRouter for SQL generation.
- **Security**: SQL validation (SELECT only) and Read-Only enforcement.

## Verification Results

### Static Analysis
Ran `python -m py_compile app.py` - **SUCCESS** (No syntax errors).

### How to Run
1.  **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```
2.  **Configure Environment**:
    Set the following environment variables (Windows PowerShell example):
    ```powershell
    $env:OPENROUTER_API_KEY="your_api_key_here"
    $env:ORACLE_PASSWORD="your_oracle_password"
    # Optional overrides:
    # $env:ORACLE_USER="sdp"
    # $env:ORACLE_DSN="localhost:1522/FREEPDB1"
    ```
3.  **Start Server**:
    ```bash
    uvicorn app:app --reload
    ```
4.  **Test Query**:
    ```bash
    curl -X POST http://127.0.0.1:8000/query `
         -H "Content-Type: application/json" `
         -d '{"question": "How many holidays are there in 2024?"}'
    ```
