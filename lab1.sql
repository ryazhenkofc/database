CREATE DATABASE lab1;

USE lab1;

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users ADD COLUMN isadmin INT;

ALTER TABLE users MODIFY COLUMN isadmin BOOLEAN;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD PRIMARY KEY (id);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    user_id INT
);

DROP TABLE tasks;

DROP DATABASE lab1;