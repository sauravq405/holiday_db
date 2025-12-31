# Implementation Plan - Oracle NL-to-SQL API Service

This plan outlines the creation of a FastAPI service that translates natural language queries into SQL and executes them against an Oracle database.

## User Review Required

> [!NOTE]
> The solution assumes the existence of the `NATIONAL_HOLIDAYS` table in the local Oracle instance.
> The API key `OPENROUTER_API_KEY` must be set in the environment for the service to function.

## Proposed Changes

### Project Root

#### [NEW] [requirements.txt](file:///d:/2025/workspaces/Git_holiday_db/holiday_db/requirements.txt)
- `fastapi`
- `uvicorn`
- `oracledb`
- `requests`
- `pydantic`
- `python-dotenv` (optional, but good for local dev)

#### [NEW] [app.py](file:///d:/2025/workspaces/Git_holiday_db/holiday_db/app.py)
This file will contain the entire logic:
1.  **Imports & Configuration**: Setup `oracledb` params, OpenRouter API key.
2.  **Database Connection**: Initialize `oracledb` connection pool on startup users `lifespan`.
3.  **LLM Integration**: Function `generate_sql(question)` sending prompt to OpenRouter.
4.  **SQL Validation**: Function `is_safe_sql(sql)` to enforce read-only and table restrictions.
5.  **API Endpoint**: `POST /query` handling the flow:
    - Get user question.
    - Generate SQL.
    - Validate SQL.
    - Execute SQL.
    - Return results.

## Verification Plan

### Automated Tests
Since the database is local to the user and not accessible to the agent, full end-to-end automated testing is not possible from the agent side.
- **Syntax Check**: I will run `python -m py_compile app.py` to ensure no syntax errors.

### Manual Verification
The user should perform the following steps:
1.  **Install Dependencies**: `pip install -r requirements.txt`
2.  **Set API Key**: `set OPENROUTER_API_KEY=sk-...`
3.  **Run Server**: `uvicorn app:app --reload`
4.  **Test Endpoint**:
    - Use `curl` or Postman to send a POST to `http://127.0.0.1:8000/query` with body `{"question": "What holidays are in 2024?"}`.
    - Verify the response contains SQL and data.
