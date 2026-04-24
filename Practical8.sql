DROP TABLE IF EXISTS SalaryAudit;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES (501, 'Alice', 50000), (502, 'Bob', 60000);

CREATE TABLE SalaryAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_salary_update;

DELIMITER //
CREATE TRIGGER trg_salary_update
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO SalaryAudit (EmpID, OldSalary, NewSalary)
        VALUES (OLD.EmpID, OLD.Salary, NEW.Salary);
    END IF;
END //
DELIMITER ;

UPDATE Employees SET Salary = Salary + 2000 WHERE EmpID = 501;
SELECT * FROM Employees;
SELECT * FROM SalaryAudit;
