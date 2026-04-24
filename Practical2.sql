CREATE DATABASE IF NOT EXISTS abc_db;
USE abc_db;

DROP TABLE IF EXISTS table_xyz;
DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    val INT CHECK (val > 0)
);

CREATE TABLE table_xyz (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    ref_id INT,
    FOREIGN KEY (ref_id) REFERENCES table_abc(id)
);

INSERT INTO table_abc VALUES 
(123, 'abc', 12),
(345, 'xyz', 34);

INSERT INTO table_xyz VALUES 
(1, 'abc', 'abc@xyz.com', 20, 123),
(2, 'xyz', 'xyz@abc.com', 22, 345);

SELECT * FROM table_xyz;
SELECT * FROM table_abc;

ALTER TABLE table_xyz ADD info VARCHAR(15);
ALTER TABLE table_xyz MODIFY email VARCHAR(150);
ALTER TABLE table_xyz DROP COLUMN info;

RENAME TABLE table_xyz TO table_pqr;

TRUNCATE TABLE table_pqr;
DROP TABLE table_pqr;
DROP TABLE table_abc;