-- Prerequisites
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(401, 'Alice', 50000),
(402, 'Bob', 60000),
(403, 'Charlie', 55000),
(404, 'David', 45000),
(405, 'Eve', 70000);

-- Actual Practical

-- Stored Procedure using Cursor
DELIMITER //
CREATE PROCEDURE IncreaseSalaryByCursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE vEmpID INT;
    DECLARE vSalary DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT EmpID, Salary FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO vEmpID, vSalary;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        UPDATE Employees SET Salary = vSalary + 1000 WHERE EmpID = vEmpID;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL IncreaseSalaryByCursor();
SELECT * FROM Employees;

-- Function using Cursor (MySQL does not allow cursors in functions, so using procedure is standard)
-- Demonstrating another procedure with cursor to collect names into a temp table
DROP TABLE IF EXISTS EmpNames;
CREATE TABLE EmpNames (Name VARCHAR(50));

DELIMITER //
CREATE PROCEDURE CollectEmployeeNames()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE vName VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT Name FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO vName;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO EmpNames VALUES (vName);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL CollectEmployeeNames();
SELECT * FROM EmpNames;
