CREATE TABLE national_holidays (
    holiday_id INTEGER PRIMARY KEY AUTOINCREMENT,
    holiday_name TEXT NOT NULL,
    holiday_date TEXT NOT NULL,
    holiday_year INTEGER NOT NULL,
    day_of_week TEXT,
    holiday_type TEXT,
    state TEXT,
    is_official INTEGER DEFAULT 0 NOT NULL,
    public_holiday INTEGER DEFAULT 0 NOT NULL
);

-- SQLite does not typically use TRUNCATE TABLE, DELETE works
-- DELETE FROM national_holidays;

-- DROP TABLE national_holidays;
