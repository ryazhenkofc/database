CREATE DATABASE lab10;

CREATE TABLE Books (
  book_id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  author VARCHAR(50),
  price NUMERIC(10, 2),
  quantity INTEGER
);

CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY,
  book_id INTEGER REFERENCES Books(book_id),
  customer_id INTEGER,
  order_date DATE,
  quantity INTEGER
);

CREATE TABLE Customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50)
);

INSERT INTO Books (title, author, price, quantity)
VALUES
  ('Database 101', 'A. Smith', 40.00, 10),
  ('Learn SQL', 'B. Johnson', 35.00, 15),
  ('Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (name, email)
VALUES
  ('John Doe', 'johndoe@example.com'),
  ('Jane Doe', 'janedoe@example.com');

-- 1.
BEGIN;

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

-- 2.

DO $$
DECLARE
    book_quantity INT;
BEGIN
    SELECT quantity INTO book_quantity
    FROM Books
    WHERE book_id = 3;

    IF book_quantity >= 10 THEN
        INSERT INTO Orders (book_id, customer_id, order_date, quantity)
        VALUES (3, 102, CURRENT_DATE, 10);
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $$;

-- 3.
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE Books
SET price = 55.00
WHERE book_id = 1;

COMMIT;

-- 4.
BEGIN TRANSACTION;

UPDATE Customers
SET email = 'testvalue@example.com'
WHERE customer_id = 102;

COMMIT;


SELECT email FROM Customers
WHERE customer_id = 102;
