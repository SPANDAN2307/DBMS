DROP TABLE IF EXISTS Archived_Products;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT,
    category VARCHAR(50)
);

CREATE TABLE Archived_Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Laptop', 1000, 'Electronics'),
(2, 'Desk', 200, 'Furniture'),
(3, 'Mouse', 50, 'Electronics');

INSERT INTO Archived_Products VALUES (1, 'Laptop'), (4, 'Keyboard');

UPDATE Products SET price = price + 50 WHERE category = 'Furniture';

DELETE FROM Products WHERE product_name LIKE 'D%';

UPDATE Products SET product_name = CONCAT(product_name, '_Discounted') WHERE price > 100 AND category IN ('Electronics', 'Furniture');

SELECT product_name FROM Products
UNION
SELECT product_name FROM Archived_Products;

CREATE ROLE IF NOT EXISTS inventory_manager;
GRANT SELECT, INSERT ON Products TO inventory_manager;
GRANT inventory_manager TO 'inventory_user'@'localhost';
REVOKE INSERT ON Products FROM inventory_manager;

START TRANSACTION;
UPDATE Products SET price = price - 10 WHERE product_id = 1;
SAVEPOINT sp1;
UPDATE Products SET price = price - 20 WHERE product_id = 3;
ROLLBACK TO sp1;
COMMIT;
