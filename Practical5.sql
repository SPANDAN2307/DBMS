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

SELECT x.id, x.info, a.name, x.val
FROM table_xyz x INNER JOIN table_abc a ON x.ref_id = a.id;

SELECT x.id, x.info, a.name
FROM table_xyz x LEFT JOIN table_abc a ON x.ref_id = a.id;

SELECT x.id, x.info, a.name
FROM table_xyz x RIGHT JOIN table_abc a ON x.ref_id = a.id;

CREATE OR REPLACE VIEW view_abc AS
SELECT x.id, x.info, a.name, x.val
FROM table_xyz x INNER JOIN table_abc a ON x.ref_id = a.id;

DROP VIEW view_abc;
