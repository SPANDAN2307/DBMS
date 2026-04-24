-- Prerequisites
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Region VARCHAR(50)
);

INSERT INTO Sales VALUES
(1, 'Laptop', 5, 60000, 'North'),
(2, 'Laptop', 3, 62000, 'South'),
(3, 'Phone', 10, 20000, 'North'),
(4, 'Phone', 8, 21000, 'South'),
(5, 'Tablet', 4, 30000, 'East'),
(6, 'Tablet', 6, 32000, 'West'),
(7, 'Laptop', 2, 61000, 'East'),
(8, 'Phone', 12, 19000, 'West');

-- Actual Practical

-- Aggregate Functions with GROUP BY
SELECT Region, SUM(Quantity) AS Total_Quantity, AVG(Price) AS Avg_Price, MAX(Price) AS Max_Price, MIN(Price) AS Min_Price
FROM Sales
GROUP BY Region;
SELECT * FROM Sales;

-- Using HAVING clause
SELECT Product, SUM(Quantity) AS Total_Sold
FROM Sales
GROUP BY Product
HAVING SUM(Quantity) > 10;
SELECT * FROM Sales;
