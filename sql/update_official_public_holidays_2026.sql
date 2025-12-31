-- Reset all to default first
UPDATE national_holidays SET is_official = 0, public_holiday = 0;

-- -----------------------------------------------------------------------------
-- GAZETTED HOLIDAYS (Central Govt Mandatory)
-- Sets is_official = 1, public_holiday = 1
-- -----------------------------------------------------------------------------

UPDATE national_holidays 
SET is_official = 1, public_holiday = 1
WHERE holiday_name IN (
    'Republic Day',
    'Holi',
    'Id-ul-Fitr', 'Idul Fitr',
    'Ram Navami',
    'Mahavir Jayanti',
    'Good Friday',
    'Buddha Purnima',
    'Id-ul-Ad''ha', 'Bakrid',
    'Ashura',
    'Independence Day',
    'Mawlid', 'Maulud Nabi',
    'Janmashtami',
    'Mahatma Gandhi Birthday',
    'Dussehra', 'Vijaya Dasami',
    'Diwali', 'Deepavali',
    'Guru Nanak''s Birthday',
    'Christmas Day'
);

-- -----------------------------------------------------------------------------
-- RESTRICTED HOLIDAYS (Central Govt Optional)
-- Sets is_official = 1, public_holiday = 0
-- -----------------------------------------------------------------------------

UPDATE national_holidays 
SET is_official = 1, public_holiday = 0
WHERE holiday_name IN (
    'New Year''s Day',
    'Makar Sankranti', 'Pongal', 'Magh Bihu', 'Magh Bihu Holiday',
    'Vasant Panchami',
    'Guru Ravidas Jayanti',
    'Maha Shivratri',
    'Chahhtrapati Shivaji Maharaj Jayanti', 'Shivaji Jayanti',
    'Holi Dahan', 'Doljatra',
    'Gudi Padwa', 'Ugadi', 'Cheti Chand',
    'Easter Sunday',
    'Vaisakhi', 'Vaisakhadi', 'Bohag Bihu', 'Bohag Bihu Holiday',
    'Raksha Bandhan',
    'Ganesh Chaturthi', 'Vinayagar Chathurthi',
    'Ratha Yatra', 'Rath Yatra',
    'Parsi New Year',
    'Onam', 'Thiruvonam', -- Often restricted/optional
    'Maha Saptami', 'Durga Ashtami', 'Mahanavami', 'Durga Puja',
    'Maharishi Valmiki Birthday',
    'Naraka Chaturdashi',
    'Govardhan Puja',
    'Bhai Bij', 'Bhratridwitiya',
    'Chhath Puja',
    'Martyrdom of Sri Guru Teg Bahadur Ji',
    'Christmas Eve',
    'Jumat-ul-Wida'
);

COMMIT;
