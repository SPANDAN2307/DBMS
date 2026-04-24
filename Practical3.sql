DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    val DECIMAL(10,2),
    dept VARCHAR(50)
);

INSERT INTO table_abc VALUES
(123, 'abc', 123.00, 'xyz'),
(345, 'def', 345.00, 'pqr'),
(678, 'ghi', 678.00, 'xyz');

INSERT INTO table_abc VALUES (901, 'jkl', 901.00, 'pqr');

UPDATE table_abc SET val = val + 123 WHERE dept = 'pqr';

DELETE FROM table_abc WHERE name LIKE 'a%';

UPDATE table_abc SET name = CONCAT(name, '_xyz') WHERE val > 123 AND dept IN ('xyz','pqr');

CREATE ROLE IF NOT EXISTS role_abc;
GRANT SELECT, INSERT ON table_abc TO role_abc;
GRANT role_abc TO 'abc_user'@'localhost';
REVOKE INSERT ON table_abc FROM role_abc;

START TRANSACTION;
UPDATE table_abc SET val = val - 12 WHERE id = 123;
SAVEPOINT sp1;
UPDATE table_abc SET val = val - 34 WHERE id = 345;
ROLLBACK TO sp1;
COMMIT;
