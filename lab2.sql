CREATE DATABASE lab2;

USE lab2;

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    population INT
);

INSERT INTO countries (country_name, region_id, population) VALUES ('TestValue', 1, 1);

INSERT INTO countries (country_name) VALUES ('Canada');

INSERT INTO countries (country_name, region_id, population) VALUES ('USA', NULL, 345825752);

INSERT INTO countries (country_name, region_id, population) VALUES
('TEST2', 2, 2), ('TEST3', 3, 3), ('TEST4', 4, 4);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population) VALUES (5, 19091234);

INSERT INTO countries () VALUES ();

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries SET region_id = 1 WHERE region_id is NULL;

SELECT country_name, population * 1.1 AS 'New Population' FROM countries;

DELETE FROM countries WHERE population < 1000000;

DELETE FROM countries_new WHERE country_id IN (SELECT country_id FROM countries) RETURNING *;

DELETE FROM countries RETURNING *;
