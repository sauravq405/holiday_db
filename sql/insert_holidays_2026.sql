/*
================================================================================
                     IMPORTANT NOTE - ORACLE IDENTITY + INSERT ALL BUG
================================================================================

Description:
Oracle versions 12c through 19c (including 18c XE) have a well-known limitation/bug 
when combining multi-row INSERT ALL statements with an identity column used as 
PRIMARY KEY.

Symptoms:
- ORA-00001: unique constraint violated on the primary key (SYS_C00xxxx)
- Even though you're not providing the identity column value, Oracle generates 
  the SAME ID for multiple rows (or very few distinct IDs) during INSERT ALL.
- The internal sequence for the identity column does NOT advance correctly 
  across the multiple INTO clauses.

Affected statement pattern (DO NOT USE):
    INSERT ALL
        INTO table (...) VALUES (...)
        INTO table (...) VALUES (...)
        ...
    SELECT 1 FROM dual;

Why it fails:
The identity generation mechanism does not handle the conditional multi-row 
processing of INSERT ALL properly → duplicate keys are attempted → constraint violation.

Workarounds used in this script:
1. Preferred: Use single-row INSERT statements (slow but 100% reliable with identity)
2. Alternative: Use INSERT ... SELECT ... UNION ALL (multi-row, works correctly)

Affected versions: Oracle 12.1 – 19c (including Express Edition)
Fixed in: Appears resolved/improved in 21c and later, but not backported reliably

Recommendation:
Always prefer INSERT ... SELECT UNION ALL or individual INSERT statements when 
working with identity columns and multi-row data loading in 18c/19c.

Last verified: January 2026 (Oracle 18c XE)
================================================================================
*/

-- Example of SAFE way (single-row inserts)
-- DELETE FROM national_holidays WHERE holiday_year = 2026;

--INSERT INTO national_holidays 
    -- (holiday_name, holiday_date, holiday_year, holiday_type, state, is_official, public_holiday)
--VALUES ('New Year''s Day', TO_DATE('2026-01-01','YYYY-MM-DD'), 2026, 'Regional Holiday', NULL, 0, 0);

-- ... continue with individual INSERTs ...


DELETE FROM national_holidays WHERE holiday_year = 2026;

INSERT ALL

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'New Year''s Day',
        TO_DATE('2026-Jan-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Gann-Ngai',
        TO_DATE('2026-Jan-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mannam Jayanthi',
        TO_DATE('2026-Jan-02', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'New Year Celebration',
        TO_DATE('2026-Jan-02', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Imam Ali''s Birthday',
        TO_DATE('2026-Jan-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Guru Gobind Singh Jayanti',
        TO_DATE('2026-Jan-05', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Missionary Day',
        TO_DATE('2026-Jan-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Birthday of Swami Vivekananda',
        TO_DATE('2026-Jan-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sankranti',
        TO_DATE('2026-Jan-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maghe Sankranti',
        TO_DATE('2026-Jan-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhogi',
        TO_DATE('2026-Jan-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tusu Puja',
        TO_DATE('2026-Jan-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sankranti',
        TO_DATE('2026-Jan-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Pongal',
        TO_DATE('2026-Jan-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Magh Bihu Holiday',
        TO_DATE('2026-Jan-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Thiruvalluvar Day',
        TO_DATE('2026-Jan-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Uzhavar Tirunal',
        TO_DATE('2026-Jan-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Shab-I-Miraj',
        TO_DATE('2026-Jan-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sonam Lhosar',
        TO_DATE('2026-Jan-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Netaji Subhas Chandra Bose Jayanti',
        TO_DATE('2026-Jan-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vasant Panchami',
        TO_DATE('2026-Jan-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Statehood Day',
        TO_DATE('2026-Jan-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Devnarayan Jayanti',
        TO_DATE('2026-Jan-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Republic Day',
        TO_DATE('2026-Jan-26', 'YYYY-Mon-DD'),
        2026,
        'Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Gothar Bathou Sun',
        TO_DATE('2026-Jan-27', 'YYYY-Mon-DD'),
        2026,
        'Not a Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Me-dam-me-phi',
        TO_DATE('2026-Jan-31', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Guru Ravidas Jayanti',
        TO_DATE('2026-Feb-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Thaipoosam',
        TO_DATE('2026-Feb-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bir Chilarai Divas',
        TO_DATE('2026-Feb-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Shab e-Barat',
        TO_DATE('2026-Feb-04', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maha Shivratri',
        TO_DATE('2026-Feb-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Lui-Ngai-Ni',
        TO_DATE('2026-Feb-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losar',
        TO_DATE('2026-Feb-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Chahhtrapati Shivaji Maharaj Jayanti',
        TO_DATE('2026-Feb-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Statehood Day',
        TO_DATE('2026-Feb-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mizoram State Day',
        TO_DATE('2026-Feb-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Holi Dahan',
        TO_DATE('2026-Mar-02', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Doljatra',
        TO_DATE('2026-Mar-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Holi',
        TO_DATE('2026-Mar-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Yaosang 2nd Day',
        TO_DATE('2026-Mar-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Dhulandi',
        TO_DATE('2026-Mar-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhumchu Festival',
        TO_DATE('2026-Mar-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Holi',
        TO_DATE('2026-Mar-04', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Chapchar Kut',
        TO_DATE('2026-Mar-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Shab-I-Qadr',
        TO_DATE('2026-Mar-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ugadi',
        TO_DATE('2026-Mar-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Cheti Chand',
        TO_DATE('2026-Mar-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        '1st Navratra',
        TO_DATE('2026-Mar-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Gudi Padwa',
        TO_DATE('2026-Mar-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Idul Fitr',
        TO_DATE('2026-Mar-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Jumat-ul-Wida',
        TO_DATE('2026-Mar-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sajibu Nongma Panba',
        TO_DATE('2026-Mar-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Gudi Padwa',
        TO_DATE('2026-Mar-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Cheti Chand',
        TO_DATE('2026-Mar-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Idul Fitr',
        TO_DATE('2026-Mar-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Id-ul-Fitr',
        TO_DATE('2026-Mar-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sarhul',
        TO_DATE('2026-Mar-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Nauroz',
        TO_DATE('2026-Mar-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Following Day of Ramazan',
        TO_DATE('2026-Mar-22', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bihar Divas',
        TO_DATE('2026-Mar-22', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sarhul Holiday',
        TO_DATE('2026-Mar-22', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Shaheedi Diwas',
        TO_DATE('2026-Mar-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ram Navami',
        TO_DATE('2026-Mar-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ashoka''s Birth Anniversary',
        TO_DATE('2026-Mar-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ram Navami',
        TO_DATE('2026-Mar-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahavir Jayanti',
        TO_DATE('2026-Mar-31', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bank Holiday',
        TO_DATE('2026-Apr-01', 'YYYY-Mon-DD'),
        2026,
        'Not a Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Odisha Day',
        TO_DATE('2026-Apr-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maundy Thursday',
        TO_DATE('2026-Apr-02', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Good Friday',
        TO_DATE('2026-Apr-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Babu Jagjivan Ram Birthday',
        TO_DATE('2026-Apr-05', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Easter Sunday',
        TO_DATE('2026-Apr-05', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Birthday of Sri Guru Nabha Dass Ji',
        TO_DATE('2026-Apr-08', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahatma Jyotiba Phule Jayanti',
        TO_DATE('2026-Apr-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Biju Festival',
        TO_DATE('2026-Apr-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ashoka''s Birth Anniversary',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vaisakhi',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Dr. Babasaheb Ambedkar Jayanti',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Cheiraoba',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahabishuba Sankranti',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tamil New Year',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bohag Bihu Holiday',
        TO_DATE('2026-Apr-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vishu',
        TO_DATE('2026-Apr-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bengali New Year',
        TO_DATE('2026-Apr-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bohag Bihu',
        TO_DATE('2026-Apr-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Himachal Day',
        TO_DATE('2026-Apr-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bohag Bihu Holiday',
        TO_DATE('2026-Apr-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tithi of Damodar Deva',
        TO_DATE('2026-Apr-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Parashurama Jayanti',
        TO_DATE('2026-Apr-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Basava Jayanthi',
        TO_DATE('2026-Apr-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Garia Puja',
        TO_DATE('2026-Apr-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sati Sadhani Divas',
        TO_DATE('2026-Apr-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Veer Kunvar Singh Jayanti',
        TO_DATE('2026-Apr-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Khongjom Day',
        TO_DATE('2026-Apr-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Janaki Nawami',
        TO_DATE('2026-Apr-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Buddha Purnima',
        TO_DATE('2026-May-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Labour Day',
        TO_DATE('2026-May-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maharashtra Day',
        TO_DATE('2026-May-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Labour Day',
        TO_DATE('2026-May-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Birthday of Rabindra Nath Tagore',
        TO_DATE('2026-May-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sikkim State Day',
        TO_DATE('2026-May-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Savitri Amavasya',
        TO_DATE('2026-May-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bakrid',
        TO_DATE('2026-May-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Id-ul-Ad''ha',
        TO_DATE('2026-May-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bakrid',
        TO_DATE('2026-May-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Eid-ul-Azha Holiday',
        TO_DATE('2026-May-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Janmotsav of Sri Sri Madhav Dev',
        TO_DATE('2026-Jun-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Pahili Raja',
        TO_DATE('2026-Jun-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'YMA Day',
        TO_DATE('2026-Jun-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Raja Sankranti',
        TO_DATE('2026-Jun-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maharana Pratap Jayanti',
        TO_DATE('2026-Jun-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Martyrdom Day of Sri Guru Arjun Dev Ji',
        TO_DATE('2026-Jun-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ashura',
        TO_DATE('2026-Jun-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ashura',
        TO_DATE('2026-Jun-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ashura',
        TO_DATE('2026-Jun-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sant Guru Kabir Jayanti',
        TO_DATE('2026-Jun-29', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Remna Ni',
        TO_DATE('2026-Jun-30', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Guru Hargobind Ji''s Birthday',
        TO_DATE('2026-Jul-05', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'MHIP Day',
        TO_DATE('2026-Jul-06', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Behdienkhlam',
        TO_DATE('2026-Jul-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhanu Jayanti',
        TO_DATE('2026-Jul-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ratha Yatra',
        TO_DATE('2026-Jul-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Harela',
        TO_DATE('2026-Jul-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'U Tirot Sing Day',
        TO_DATE('2026-Jul-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kharchi Puja',
        TO_DATE('2026-Jul-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Martyrdom Day of Shaheed Udham Singh',
        TO_DATE('2026-Jul-31', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Chehlum',
        TO_DATE('2026-Aug-04', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ker Puja',
        TO_DATE('2026-Aug-07', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tendong Lho Rum Faat',
        TO_DATE('2026-Aug-08', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'World Tribal Day',
        TO_DATE('2026-Aug-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bonalu',
        TO_DATE('2026-Aug-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Karkidaka Vavu',
        TO_DATE('2026-Aug-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Patriot''s Day',
        TO_DATE('2026-Aug-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Independence Day',
        TO_DATE('2026-Aug-15', 'YYYY-Mon-DD'),
        2026,
        'Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Parsi New Year',
        TO_DATE('2026-Aug-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'De jure Transfer Day',
        TO_DATE('2026-Aug-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mawlid',
        TO_DATE('2026-Aug-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'First Onam',
        TO_DATE('2026-Aug-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mawlid',
        TO_DATE('2026-Aug-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maulud Nabi',
        TO_DATE('2026-Aug-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Thiruvonam',
        TO_DATE('2026-Aug-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Raksha Bandhan',
        TO_DATE('2026-Aug-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Third Onam',
        TO_DATE('2026-Aug-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Jhulan Purnima',
        TO_DATE('2026-Aug-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Raksha Bandhan',
        TO_DATE('2026-Aug-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Friday after Eid e-Milad-un Nabi',
        TO_DATE('2026-Aug-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Fourth Onam',
        TO_DATE('2026-Aug-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ayyankali Jayanthi',
        TO_DATE('2026-Aug-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sree Narayana Guru Jayanti',
        TO_DATE('2026-Aug-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tithi of Sri Sri Madhav Dev',
        TO_DATE('2026-Sep-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Janmashtami',
        TO_DATE('2026-Sep-04', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Karam Puja',
        TO_DATE('2026-Sep-05', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Tithi of Srimatna Sankardev',
        TO_DATE('2026-Sep-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ganesh Chaturthi',
        TO_DATE('2026-Sep-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vinayagar Chathurthi',
        TO_DATE('2026-Sep-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ganesh Chaturthi Holiday',
        TO_DATE('2026-Sep-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Samvatsari',
        TO_DATE('2026-Sep-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Nuakhai',
        TO_DATE('2026-Sep-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Day following Nuakhai',
        TO_DATE('2026-Sep-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sree Narayana Guru Samadhi',
        TO_DATE('2026-Sep-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ramdev Jayanti and Teja Dashmi',
        TO_DATE('2026-Sep-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Janmostav of Srimatna Sankardev',
        TO_DATE('2026-Sep-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Janmashtami',
        TO_DATE('2026-Sep-22', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Haryana Heroes'' Martyrdom Day',
        TO_DATE('2026-Sep-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maharaja Hari Singh Birth Anniversary',
        TO_DATE('2026-Sep-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Jananeta Irawat Birth Day',
        TO_DATE('2026-Sep-30', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahatma Gandhi Birthday',
        TO_DATE('2026-Oct-02', 'YYYY-Mon-DD'),
        2026,
        'Public Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahalaya',
        TO_DATE('2026-Oct-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maharaja Agrasen Jayanti',
        TO_DATE('2026-Oct-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maha Saptami',
        TO_DATE('2026-Oct-17', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Saddula Bathukamma',
        TO_DATE('2026-Oct-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kati Bihu',
        TO_DATE('2026-Oct-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maha Saptami',
        TO_DATE('2026-Oct-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Navami of Durga Puja',
        TO_DATE('2026-Oct-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Durga Ashtami',
        TO_DATE('2026-Oct-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahanavami',
        TO_DATE('2026-Oct-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ayudha Puja',
        TO_DATE('2026-Oct-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Navami of Durga Puja',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Mahanavami',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ayudha Puja',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Dussehra',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Dussehra',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Durga Puja',
        TO_DATE('2026-Oct-20', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Dussehra',
        TO_DATE('2026-Oct-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Durga Puja',
        TO_DATE('2026-Oct-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Durga Puja',
        TO_DATE('2026-Oct-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Following day of Vijaya Dasami Holiday',
        TO_DATE('2026-Oct-21', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kumar Purnima',
        TO_DATE('2026-Oct-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Lakshmi Puja Holiday',
        TO_DATE('2026-Oct-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Maharishi Valmiki Birthday',
        TO_DATE('2026-Oct-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Accession Day',
        TO_DATE('2026-Oct-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Sardar Patel''s Birthday',
        TO_DATE('2026-Oct-31', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Haryana Day',
        TO_DATE('2026-Nov-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kannada Rajyothsava',
        TO_DATE('2026-Nov-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kut',
        TO_DATE('2026-Nov-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Puducherry Liberation Day',
        TO_DATE('2026-Nov-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Lhabab Duechen',
        TO_DATE('2026-Nov-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Diwali',
        TO_DATE('2026-Nov-08', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kali Puja',
        TO_DATE('2026-Nov-08', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Narak Chaturdashi',
        TO_DATE('2026-Nov-08', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Govardhan Puja',
        TO_DATE('2026-Nov-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vishvakarma Day',
        TO_DATE('2026-Nov-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Diwali Holiday',
        TO_DATE('2026-Nov-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Vikram Samvat New Year',
        TO_DATE('2026-Nov-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhai Bij',
        TO_DATE('2026-Nov-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Diwali (Bali Pratipada)',
        TO_DATE('2026-Nov-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhai Bij',
        TO_DATE('2026-Nov-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Bhratridwitiya',
        TO_DATE('2026-Nov-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Ningol Chakkouba',
        TO_DATE('2026-Nov-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Wangala Festival',
        TO_DATE('2026-Nov-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Chhath Puja',
        TO_DATE('2026-Nov-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Birsa Munda Birth Anniversary',
        TO_DATE('2026-Nov-15', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kartar Singh Sarabha Martyrdom Day',
        TO_DATE('2026-Nov-16', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Seng Kut Snem',
        TO_DATE('2026-Nov-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Guru Nanak''s Birthday',
        TO_DATE('2026-Nov-24', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Lachit Divas',
        TO_DATE('2026-Nov-24', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Rasa Purnima',
        TO_DATE('2026-Nov-24', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Kanakadasa Jayanthi',
        TO_DATE('2026-Nov-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Indigenous Faith Day',
        TO_DATE('2026-Dec-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'State Inauguration Day',
        TO_DATE('2026-Dec-01', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Asom Divas',
        TO_DATE('2026-Dec-02', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Feast of St. Francis Xavier',
        TO_DATE('2026-Dec-03', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losoong/Namsoong',
        TO_DATE('2026-Dec-09', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losoong/Namsoong',
        TO_DATE('2026-Dec-10', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losoong/Namsoong',
        TO_DATE('2026-Dec-11', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Pa Togan Nengminza Sangma',
        TO_DATE('2026-Dec-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losoong/Namsoong',
        TO_DATE('2026-Dec-12', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Losoong/Namsoong',
        TO_DATE('2026-Dec-13', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Martyrdom of Sri Guru Teg Bahadur Ji',
        TO_DATE('2026-Dec-14', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Death Anniversary of U SoSo Tham',
        TO_DATE('2026-Dec-18', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Goa Liberation Day',
        TO_DATE('2026-Dec-19', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Imam Ali''s Birthday',
        TO_DATE('2026-Dec-23', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Christmas Eve',
        TO_DATE('2026-Dec-24', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Christmas Day',
        TO_DATE('2026-Dec-25', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Christmas Holiday',
        TO_DATE('2026-Dec-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Boxing Day',
        TO_DATE('2026-Dec-26', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Christmas Festival',
        TO_DATE('2026-Dec-27', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'Parkash Gurpurab Sri Guru Gobind Singh Ji',
        TO_DATE('2026-Dec-28', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'U Kiang Nangbah',
        TO_DATE('2026-Dec-30', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    

    INTO national_holidays (
        holiday_name,
        holiday_date,
        holiday_year,
        holiday_type,
        state,
        is_official,
        public_holiday
    ) VALUES (
        'New Year''s Eve',
        TO_DATE('2026-Dec-31', 'YYYY-Mon-DD'),
        2026,
        'Regional Holiday',
        NULL,
        0,
        0
    )
    
SELECT 1 FROM dual;

--COMMIT -- Please remember to commit.