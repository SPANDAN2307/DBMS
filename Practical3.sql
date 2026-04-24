DROP TABLE IF EXISTS Employees;

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

UPDATE Employees SET Salary = Salary + 5000 WHERE Department = 'IT';

DELETE FROM Employees WHERE Name LIKE 'D%';

UPDATE Employees SET Name = CONCAT(Name, '_Updated') WHERE Salary > 55000 AND Department IN ('Finance','IT');

CREATE ROLE IF NOT EXISTS hr_role;
GRANT SELECT, INSERT ON Employees TO hr_role;
GRANT hr_role TO 'hr_user'@'localhost';
REVOKE INSERT ON Employees FROM hr_role;

START TRANSACTION;
UPDATE Employees SET Salary = Salary - 2000 WHERE EmpID = 1;
SAVEPOINT sp1;
UPDATE Employees SET Salary = Salary - 2000 WHERE EmpID = 2;
ROLLBACK TO sp1;
COMMIT;
