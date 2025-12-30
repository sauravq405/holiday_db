import pandas as pd

# -----------------------------
# Configuration
# -----------------------------
CSV_PATH = "holidays_2026.csv"          # input CSV
OUTPUT_SQL = "national_holidays_2026.sql"
YEAR = 2026

# -----------------------------
# Load CSV
# -----------------------------
df = pd.read_csv(CSV_PATH)

# Expected CSV columns:
# day_of_week | date (e.g. 'Jan-01' or 'Jan 01') | holiday_name | holiday_type

# Normalize date format if needed (replace space with dash)
df["date"] = df["date"].str.replace(" ", "-", regex=False)

# -----------------------------
# Generate SQL
# -----------------------------
lines = []
lines.append("INSERT ALL")

for _, r in df.iterrows():
    holiday_name = str(r["holiday_name"]).replace("'", "''")
    holiday_type = str(r["holiday_type"]).replace("'", "''")
    date_str = f"{YEAR}-{r['date']}"

    lines.append(f"""
    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        '{holiday_name}',
        TO_DATE('{date_str}', 'YYYY-Mon-DD'),
        {YEAR},
        '{holiday_type}',
        NULL,
        0,
        0
    )
    """)

lines.append("SELECT 1 FROM dual;")

# -----------------------------
# Write to file
# -----------------------------
with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
    f.write("\n".join(lines))

print(f"SQL file generated successfully: {OUTPUT_SQL}")
