-- Prerequisites
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'IT'),
(3, 'Charlie', 55000, 'Finance'),
(4, 'David', 45000, 'IT');

-- Actual Practical

-- a) Data Manipulation (DML)
INSERT INTO Employees VALUES (5, 'Eve', 70000, 'Finance');
SELECT * FROM Employees;

UPDATE Employees SET Salary = Salary + 5000 WHERE Department = 'IT';
SELECT * FROM Employees;

DELETE FROM Employees WHERE Name LIKE 'D%';
SELECT * FROM Employees;

-- Arithmetic, logical, set operators, pattern matching, string functions
UPDATE Employees SET Name = CONCAT(Name, '_Updated') WHERE Salary > 55000 AND Department IN ('Finance','IT');
SELECT * FROM Employees;

-- b) Access Control (DCL)
CREATE ROLE hr_role;
GRANT SELECT, INSERT ON Employees TO hr_role;
GRANT hr_role TO 'hr_user'@'localhost';
SELECT * FROM Employees;

REVOKE INSERT ON Employees FROM hr_role;
SELECT * FROM Employees;

-- c) Transaction Control (TCL)
START TRANSACTION;
UPDATE Employees SET Salary = Salary - 2000 WHERE EmpID = 1;
SAVEPOINT deduct_salary;
UPDATE Employees SET Salary = Salary - 2000 WHERE EmpID = 2;
ROLLBACK TO deduct_salary;
COMMIT;
SELECT * FROM Employees;
