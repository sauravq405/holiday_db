CREATE USER sdp IDENTIFIED BY "sdp"   -- use a stronger password!
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users;
