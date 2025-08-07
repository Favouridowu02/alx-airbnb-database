-- Script to create airbnbclone_db and airbnbclone_user (MySQL version)

-- Script to change MySQL password policy (example: set policy to LOW)

-- Set the password policy to LOW (allows simpler passwords)
SET GLOBAL validate_password.policy = LOW;

-- Optionally, set minimum password length (example: 6)
SET GLOBAL validate_password.length = 6;

-- Create the database
CREATE DATABASE IF NOT EXISTS airbnbclone_db;

-- Create the user and set a password
CREATE USER IF NOT EXISTS 'airbnbclone_user'@'localhost' IDENTIFIED BY 'airbnbclone_pwd';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON airbnbclone_db.* TO 'airbnbclone_user'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;

-- sudo mysql -u airbnbclone_user -p airbnbclone_db 