CREATE DATABASE lab5;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE salesmen (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    comission DOUBLE PRECISION
);

CREATE TABLE orders (
    order_no INT PRIMARY KEY,
    purch_amt DOUBLE PRECISION,
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesmen(salesman_id)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3001, 'Brad Guzan', 'London', NULL, 5005);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.50, '2012-10-05', 3005, 5002);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70004, 110.50, '2012-08-17', 3009, 5003);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70007, 948.50, '2012-09-10', 3005, 5002);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70005, 2400.60, '2012-07-27', 3007, 5001);
INSERT INTO orders (order_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5003, 'Lauson Hen', NULL, 0.12);
INSERT INTO salesmen (salesman_id, name, city, comission) VALUES (5007, 'Paul Adam', 'Rome', 0.13);

SELECT SUM(purch_amt) AS total_purch_amount
FROM orders;

SELECT AVG(purch_amt) AS average_pur_amount
FROM orders;

SELECT COUNT(cust_name) 
FROM customers
WHERE cust_name IS NOT NULL;

SELECT MIN(purch_amt) AS min_purch_amount
FROM orders;

SELECT * FROM customers
WHERE cust_name LIKE '%b';

SELECT order_no FROM orders
WHERE customer_id IN (
    SELECT customer_id FROM customers
    WHERE city = 'New York'
);

SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    WHERE purch_amt > 10
);

SELECT SUM(grade) AS total_grade
FROM customers;

SELECT * FROM customers
WHERE cust_name IS NOT NULL;

SELECT MAX(grade) AS max_grade
FROM customers;