-- Update the day_of_week column for existing records
-- Uses Oracle's TO_CHAR function with 'fmDay' model to get the full name of the day (e.g., 'Monday')
-- 'fm' modifier suppresses trailing spaces

UPDATE national_holidays
SET day_of_week = TO_CHAR(holiday_date, 'fmDay');

COMMIT;
