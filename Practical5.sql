DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

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

INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT');
INSERT INTO Employees VALUES (101, 'Alice', 1, 50000), (102, 'Bob', 2, 60000);

SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e INNER JOIN Departments d ON e.DeptID = d.DeptID;

SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e LEFT JOIN Departments d ON e.DeptID = d.DeptID;

SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e RIGHT JOIN Departments d ON e.DeptID = d.DeptID;

CREATE OR REPLACE VIEW EmployeeDetails AS
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e INNER JOIN Departments d ON e.DeptID = d.DeptID;

DROP VIEW EmployeeDetails;
