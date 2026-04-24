DROP TABLE IF EXISTS table_xyz;
DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE table_xyz (
    id INT PRIMARY KEY,
    info VARCHAR(50),
    ref_id INT,
    val DECIMAL(10,2),
    FOREIGN KEY (ref_id) REFERENCES table_abc(id)
);

INSERT INTO table_abc VALUES (123, 'abc'), (345, 'xyz');
INSERT INTO table_xyz VALUES (12, 'pqr', 123, 123.00), (34, 'def', 345, 345.00);

SELECT id, info, val FROM table_xyz 
WHERE val > (SELECT AVG(val) FROM table_xyz);

SELECT name FROM table_abc 
WHERE id IN (SELECT ref_id FROM table_xyz WHERE val > 123);

SELECT id, info, ref_id FROM table_xyz 
WHERE ref_id IN (SELECT ref_id FROM table_xyz GROUP BY ref_id HAVING COUNT(*) > 1);

SELECT id, info, ref_id, val FROM table_xyz x 
WHERE val = (SELECT MAX(val) FROM table_xyz WHERE ref_id = x.ref_id);
