DROP TABLE IF EXISTS table_xyz;
DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    val INT,
    dept VARCHAR(50)
);

CREATE TABLE table_xyz (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO table_abc VALUES
(1, 'abc_name', 100, 'dept_A'),
(2, 'def_name', 200, 'dept_B'),
(3, 'ghi_name', 300, 'dept_A');

INSERT INTO table_xyz VALUES (1, 'abc_name'), (4, 'jkl_name');

UPDATE table_abc SET val = val + 50 WHERE dept = 'dept_B';

DELETE FROM table_abc WHERE name LIKE 'd%';

UPDATE table_abc SET name = CONCAT(name, '_updated') WHERE val > 100 AND dept IN ('dept_A', 'dept_B');

SELECT name FROM table_abc
UNION
SELECT name FROM table_xyz;

CREATE ROLE IF NOT EXISTS role_abc;
GRANT SELECT, INSERT ON table_abc TO role_abc;
GRANT role_abc TO 'abc_user'@'localhost';
REVOKE INSERT ON table_abc FROM role_abc;

START TRANSACTION;
UPDATE table_abc SET val = val - 10 WHERE id = 1;
SAVEPOINT sp1;
UPDATE table_abc SET val = val - 20 WHERE id = 3;
ROLLBACK TO sp1;
COMMIT;
