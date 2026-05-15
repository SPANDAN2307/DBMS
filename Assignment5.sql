DROP VIEW IF EXISTS Customer_Orders;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_desc VARCHAR(50),
    customer_id INT,
    total_amount INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Orders VALUES (101, 'Laptop', 1, 1500), (102, 'Phone', 2, 800), (103, 'Tablet', NULL, 600);

SELECT o.order_id, o.order_desc, c.customer_name, o.total_amount
FROM Orders o INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT o.order_id, o.order_desc, c.customer_name, o.total_amount
FROM Orders o LEFT JOIN Customers c ON o.customer_id = c.customer_id;

SELECT o.order_id, o.order_desc, c.customer_name, o.total_amount
FROM Orders o RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

SELECT * FROM Orders NATURAL JOIN Customers;

CREATE OR REPLACE VIEW Customer_Orders AS
SELECT o.order_id, o.order_desc, c.customer_name, o.total_amount
FROM Orders o INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT * FROM Customer_Orders;

DROP VIEW Customer_Orders;
