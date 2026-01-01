-- See which records now have public_holiday = 1
SELECT holiday_date, holiday_name, public_holiday
FROM national_holidays
WHERE holiday_year = 2026 
  AND public_holiday = 1
ORDER BY holiday_date;

-- Count how many you updated
SELECT COUNT(*) AS national_public_holidays
FROM national_holidays
WHERE holiday_year = 2026 AND public_holiday = 1;

-- Show all duplicates for manual decision
SELECT holiday_date, holiday_name, holiday_type, COUNT(*)
FROM national_holidays
WHERE holiday_year = 2026
GROUP BY holiday_date, holiday_name, holiday_type
HAVING COUNT(*) > 1
ORDER BY holiday_date;

-- Then delete the unwanted ones manually, e.g.:
DELETE FROM national_holidays 
WHERE holiday_name = 'Ashura' 
  AND holiday_date = DATE '2026-06-25'
  AND holiday_id > (SELECT MIN(holiday_id) 
                    FROM national_holidays 
                    WHERE holiday_name = 'Ashura' 
                      AND holiday_date = DATE '2026-06-25');