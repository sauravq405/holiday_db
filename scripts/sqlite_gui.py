"""
SQLite minimal GUI using Streamlit
----------------------------------

Directory layout:
cd ~ (home)
├── sqlite_gui.py
├── requirements.txt
├── holiday.db
└── myenv/

Virtual environment setup (one-time):
------------------------------------
python3 -m venv myenv
source myenv/bin/activate

Install dependencies:
---------------------
pip install -r requirements.txt

Run the app:
------------
streamlit run sqlite_gui.py --server.address 0.0.0.0 --server.port 8501

Access from local Windows browser:
---------------------------------
http://<VM-IP>:8501

Exit venv:
----------
deactivate
"""

import sqlite3
import pandas as pd
import streamlit as st

DB_PATH = "/holiday/home/holiday.db"

st.set_page_config(
    page_title="SQLite GUI",
    layout="wide"
)

st.title("SQLite Query Console")
st.caption("Database: holiday.db (local to VM)")

query = st.text_area(
    "Enter SQL query",
    value="SELECT name FROM sqlite_master WHERE type='table';",
    height=120
)

if st.button("Run Query"):
    try:
        conn = sqlite3.connect(DB_PATH)
        df = pd.read_sql_query(query, conn)
        conn.close()

        st.success(f"Rows returned: {len(df)}")
        st.dataframe(df, use_container_width=True)

    except Exception as e:
        st.error(str(e))
