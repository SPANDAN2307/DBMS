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
    val INT,
    FOREIGN KEY (ref_id) REFERENCES table_abc(id)
);

INSERT INTO table_abc VALUES (1, 'dept_A'), (2, 'dept_B');

INSERT INTO table_xyz VALUES (101, 'emp_X', 1, 5000), (102, 'emp_Y', 2, 7000), (103, 'emp_Z', 1, 6000);

SELECT id, info, val FROM table_xyz 
WHERE val > (SELECT AVG(val) FROM table_xyz);

SELECT name FROM table_abc 
WHERE id IN (SELECT ref_id FROM table_xyz WHERE val > 5500);

SELECT id, info, ref_id FROM table_xyz 
WHERE ref_id IN (SELECT ref_id FROM table_xyz GROUP BY ref_id HAVING COUNT(*) > 1);

SELECT id, info, ref_id, val FROM table_xyz x 
WHERE val = (SELECT MAX(val) FROM table_xyz WHERE ref_id = x.ref_id);
