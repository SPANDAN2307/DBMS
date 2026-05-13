DROP VIEW IF EXISTS view_abc;
DROP TABLE IF EXISTS table_xyz;
DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    ref_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE table_xyz (
    id INT PRIMARY KEY,
    info VARCHAR(50),
    ref_id INT,
    val INT,
    FOREIGN KEY (ref_id) REFERENCES table_abc(ref_id)
);

INSERT INTO table_abc VALUES (1, 'dept_A'), (2, 'dept_B'), (3, 'dept_C');

INSERT INTO table_xyz VALUES (101, 'emp_X', 1, 5000), (102, 'emp_Y', 2, 7000), (103, 'emp_Z', NULL, 6000);

SELECT x.id, x.info, a.name, x.val
FROM table_xyz x INNER JOIN table_abc a ON x.ref_id = a.ref_id;

SELECT x.id, x.info, a.name, x.val
FROM table_xyz x LEFT JOIN table_abc a ON x.ref_id = a.ref_id;

SELECT x.id, x.info, a.name, x.val
FROM table_xyz x RIGHT JOIN table_abc a ON x.ref_id = a.ref_id;

SELECT * FROM table_xyz NATURAL JOIN table_abc;

CREATE OR REPLACE VIEW view_abc AS
SELECT x.id, x.info, a.name, x.val
FROM table_xyz x INNER JOIN table_abc a ON x.ref_id = a.ref_id;

SELECT * FROM view_abc;

DROP VIEW view_abc;
