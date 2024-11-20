
-- 1.
CREATE DATABASE lab8;

-- 2.

CREATE TABLE salesman (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    commission DECIMAL(10, 2)
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    grade INT,
    salesman_id INT REFERENCES salesman(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT REFERENCES customers(id),
    amount DECIMAL(10, 2)
);

-- 3.
CREATE ROLE junior_dev LOGIN;

-- 4.
CREATE VIEW salesmen_in_newyork AS
SELECT * FROM salesman
WHERE city = 'New York';

-- 5.

CREATE VIEW orders_with_details AS
SELECT 
    o.id AS order_id, 
    o.order_date, 
    c.name AS customer_name, 
    s.name AS salesman_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN salesman s ON c.salesman_id = s.id;

GRANT ALL PRIVILEGES ON orders_with_details TO junior_dev;

-- 6.

CREATE VIEW customers_highest_grade AS
SELECT * FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON customers_highest_grade TO junior_dev;

-- 7.
CREATE VIEW salesmen_count_per_city AS
SELECT city, COUNT(*) AS salesman_count
FROM salesman
GROUP BY city;

-- 8.
CREATE VIEW salesmen_with_multiple_customers AS
SELECT s.id, s.name, COUNT(c.id) AS customer_count
FROM salesman s
JOIN customers c ON s.id = c.salesman_id
GROUP BY s.id, s.name
HAVING COUNT(c.id) > 1;

-- 9.
CREATE ROLE intern;
GRANT junior_dev TO intern;
