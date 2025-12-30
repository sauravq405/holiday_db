CREATE OR REPLACE TRIGGER trg_national_holidays_bi
BEFORE INSERT ON national_holidays
FOR EACH ROW
WHEN (NEW.holiday_id IS NULL)
BEGIN
    SELECT national_holidays_seq.NEXTVAL
    INTO   :NEW.holiday_id
    FROM   dual;
END;
/


SELECT trigger_name, triggering_event, status
FROM user_triggers
WHERE table_name = 'NATIONAL_HOLIDAYS';
