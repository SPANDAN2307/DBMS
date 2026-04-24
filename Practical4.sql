DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    item VARCHAR(50),
    qty INT,
    val DECIMAL(10,2),
    cat VARCHAR(50)
);

INSERT INTO table_abc VALUES
(123, 'abc', 12, 123.00, 'xyz'),
(345, 'abc', 34, 345.00, 'pqr'),
(678, 'def', 56, 678.00, 'xyz');

SELECT cat, SUM(qty) AS total_qty, AVG(val) AS avg_val, MAX(val) AS max_val, MIN(val) AS min_val
FROM table_abc
GROUP BY cat;

SELECT item, SUM(qty) AS total_sold
FROM table_abc
GROUP BY item
HAVING SUM(qty) > 12;
