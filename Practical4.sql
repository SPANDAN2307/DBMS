DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    item VARCHAR(50),
    qty INT,
    val INT,
    cat VARCHAR(50)
);

INSERT INTO table_abc VALUES
(1, 'item_A', 10, 100, 'cat_X'),
(2, 'item_A', 20, 200, 'cat_Y'),
(3, 'item_B', 30, 300, 'cat_X'),
(4, 'item_B', 5,  50,  'cat_Y');

CREATE INDEX idx_cat ON table_abc(cat);

SELECT cat, SUM(qty) AS total_qty, AVG(val) AS avg_val, MAX(val) AS max_val, MIN(val) AS min_val
FROM table_abc
GROUP BY cat;

SELECT item, SUM(qty) AS total_sold
FROM table_abc
GROUP BY item
HAVING SUM(qty) > 15
ORDER BY total_sold DESC;

SELECT * FROM table_abc ORDER BY val ASC;
