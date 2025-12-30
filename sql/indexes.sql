CREATE INDEX idx_nh_year
ON national_holidays (holiday_year);

CREATE INDEX idx_nh_date
ON national_holidays (holiday_date);

CREATE INDEX idx_nh_name
ON national_holidays (holiday_name);

CREATE INDEX idx_nh_type
ON national_holidays (holiday_type);

CREATE INDEX idx_nh_state
ON national_holidays (state);

CREATE INDEX idx_nh_public
ON national_holidays (public_holiday);
