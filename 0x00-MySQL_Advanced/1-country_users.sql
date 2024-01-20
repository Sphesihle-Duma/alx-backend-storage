-- Creating a userd table
-- id: integer primary key, auto increment
-- email: string(255 characters)
-- name: string(255 characters)
-- country: enumaration with this (US, CO, TN)
CREATE TABLE IF NOT EXISTS users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	country ENUM('US', 'CO', 'TN') DEFAULT 'US'
)
