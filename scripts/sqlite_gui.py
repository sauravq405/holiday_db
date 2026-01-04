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

Run the app in detached mode:
------------
nohup streamlit run sqlite_gui.py --server.address 0.0.0.0 --server.port 8501 > streamlit.log 2>&1 &

To kill it:
------------
Find the Process ID (PID):

ps aux | grep streamlit

Example:
USER	PID	%CPU	%MEM	COMMAND
holiday	16288	3.2	1.1	/home/holiday/myenv/bin/python3 ... streamlit ...

Kill the process:
------------
kill -9 <PID>


Access from local Windows browser:
---------------------------------
http://<VM-IP>:8501

Exit venv:
----------
deactivate
"""

import os
import sqlite3
import pandas as pd
import streamlit as st

DB_PATH = os.path.expanduser("~/holiday.db")
st.write("Resolved DB path:", DB_PATH)

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
