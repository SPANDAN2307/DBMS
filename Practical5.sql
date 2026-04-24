-- Prerequisites
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 3, 55000),
(104, 'David', 2, 45000),
(105, 'Eve', 3, 70000);

-- Actual Practical

-- INNER JOIN
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;
SELECT * FROM Employees;
SELECT * FROM Departments;

-- LEFT JOIN
SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;
SELECT * FROM Employees;
SELECT * FROM Departments;

-- RIGHT JOIN
SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;
SELECT * FROM Employees;
SELECT * FROM Departments;

-- FULL OUTER JOIN (using UNION for systems without FULL OUTER JOIN)
SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID
UNION
SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;
SELECT * FROM Employees;
SELECT * FROM Departments;

-- Creating a View
CREATE VIEW EmployeeDetails AS
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

SELECT * FROM EmployeeDetails;

-- Updating a View
CREATE OR REPLACE VIEW HighSalaryEmployees AS
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.Salary > 55000;

SELECT * FROM HighSalaryEmployees;

-- Dropping a View
DROP VIEW HighSalaryEmployees;
SELECT * FROM Employees;
SELECT * FROM Departments;
