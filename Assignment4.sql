DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT,
    amount INT,
    category VARCHAR(50)
);

INSERT INTO Sales VALUES
(1, 'Laptop', 10, 10000, 'Electronics'),
(2, 'Laptop', 20, 20000, 'Electronics'),
(3, 'Desk', 30, 6000, 'Furniture'),
(4, 'Desk', 5,  1000, 'Furniture');

CREATE INDEX idx_category ON Sales(category);

SELECT category, SUM(quantity) AS total_quantity, AVG(amount) AS avg_amount, MAX(amount) AS max_amount, MIN(amount) AS min_amount
FROM Sales
GROUP BY category;

SELECT product_name, SUM(quantity) AS total_sold
FROM Sales
GROUP BY product_name
HAVING SUM(quantity) > 15
ORDER BY total_sold DESC;

SELECT * FROM Sales ORDER BY amount ASC;
