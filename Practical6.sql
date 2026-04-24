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

-- Subquery: Find employees whose salary is greater than the average salary
SELECT EmpID, Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
SELECT * FROM Employees;

-- Subquery: Find departments that have employees earning more than 60000
SELECT DeptName
FROM Departments
WHERE DeptID IN (SELECT DeptID FROM Employees WHERE Salary > 60000);
SELECT * FROM Departments;

-- Subquery: Find employees working in departments with more than one employee
SELECT EmpID, Name, DeptID
FROM Employees
WHERE DeptID IN (
    SELECT DeptID
    FROM Employees
    GROUP BY DeptID
    HAVING COUNT(*) > 1
);
SELECT * FROM Employees;

-- Correlated Subquery: Find employees whose salary is the maximum in their department
SELECT EmpID, Name, DeptID, Salary
FROM Employees e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DeptID = e.DeptID
);
SELECT * FROM Employees;
