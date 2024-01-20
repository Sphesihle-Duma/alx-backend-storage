-- Creating a users table
-- id: Integer primary key
-- email: string(255 characters)
-- name: string(255 characters)
CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
)
