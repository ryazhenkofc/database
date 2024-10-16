CREATE DATABASE lab4;

CREATE TABLE Warehouses (
    code SERIAL PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE Boxes (
    code VARCHAR(4),
    contents VARCHAR(255),
    value INTEGER,
    warehouse INTEGER
);

INSERT INTO Warehouses (location, capacity) VALUES ('Chicago', 3);
INSERT INTO Warehouses (location, capacity) VALUES ('Chicago', 4);
INSERT INTO Warehouses (location, capacity) VALUES ('New York', 7);
INSERT INTO Warehouses (location, capacity) VALUES ('Los Angeles', 2);
INSERT INTO Warehouses (location, capacity) VALUES ('San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes
WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT warehouse, COUNT(*) AS number_of_boxes FROM Boxes
GROUP BY warehouse
ORDER BY warehouse ASC;

SELECT warehouse, COUNT(*) AS number_of_boxes FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2
ORDER BY warehouse ASC;

INSERT INTO Warehouses (location, capacity) VALUES ('New York', 3);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 6);

UPDATE Boxes
SET value = value * 0.85
WHERE value = (
    SELECT value FROM Boxes
    ORDER BY value DESC
    OFFSET 2 LIMIT 1
);

DELETE FROM Boxes
WHERE value < 150;

DELETE FROM Boxes
WHERE warehouse = (
    SELECT code FROM Warehouses
    WHERE location = 'New York'
)
RETURNING *;

SELECT * FROM Warehouses;