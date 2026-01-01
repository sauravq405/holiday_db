-- 1. Reset everything to 0 first (safety step - optional if you trust current data)
UPDATE national_holidays
SET public_holiday = 0
WHERE holiday_year = 2026;

-- 2. Set 1 for the confirmed national gazetted holidays
-- (based on official 2026 central government list)
UPDATE national_holidays
SET public_holiday = 1
WHERE holiday_year = 2026
  AND (
      -- The three compulsory national holidays (always gazetted)
      holiday_name IN (
          'Republic Day',
          'Independence Day',
          'Mahatma Gandhi Birthday'          -- also known as Gandhi Jayanti
      )
      -- Other major gazetted holidays (widely observed nationally)
      OR holiday_name IN (
          'Holi',                             -- main day
          'Idul Fitr', 'Id-ul-Fitr',          -- variations of Eid-ul-Fitr
          'Good Friday',
          'Buddha Purnima',
          'Id-ul-Zuha', 'Bakrid', 'Id-ul-Ad''ha',  -- variations of Eid-ul-Adha/Bakrid
          'Mahavir Jayanti',
          'Christmas Day'
      )
      -- Add more if your list uses exact name matches
      OR (holiday_name LIKE '%Ram Navami%' AND holiday_date = TO_DATE('2026-03-26', 'YYYY-MM-DD'))
      OR (holiday_name LIKE '%Muharram%' AND holiday_date BETWEEN TO_DATE('2026-06-25', 'YYYY-MM-DD') AND TO_DATE('2026-06-26', 'YYYY-MM-DD'))
  );

COMMIT;