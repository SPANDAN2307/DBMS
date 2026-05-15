CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    budget INT CHECK (budget > 0)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments VALUES 
(1, 'HR', 50000),
(2, 'Engineering', 150000);

INSERT INTO Employees VALUES 
(101, 'Alice Smith', 'alice@company.com', 28, 1),
(102, 'Bob Johnson', 'bob@company.com', 35, 2);

SELECT * FROM Departments;
SELECT * FROM Employees;

ALTER TABLE Employees ADD phone VARCHAR(15);
ALTER TABLE Employees MODIFY email VARCHAR(150);
ALTER TABLE Employees DROP COLUMN phone;

RENAME TABLE Employees TO Staff;

TRUNCATE TABLE Staff;

DROP TABLE Staff;
DROP TABLE Departments;
