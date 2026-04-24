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

SELECT EmpID, Name, Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT DeptName FROM Departments 
WHERE DeptID IN (SELECT DeptID FROM Employees WHERE Salary > 50000);

SELECT EmpID, Name, DeptID FROM Employees 
WHERE DeptID IN (SELECT DeptID FROM Employees GROUP BY DeptID HAVING COUNT(*) > 1);

SELECT EmpID, Name, DeptID, Salary FROM Employees e 
WHERE Salary = (SELECT MAX(Salary) FROM Employees WHERE DeptID = e.DeptID);
