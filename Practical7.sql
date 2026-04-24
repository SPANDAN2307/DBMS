DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES (401, 'Alice', 50000), (402, 'Bob', 60000);

DROP PROCEDURE IF EXISTS IncreaseSalaryByCursor;

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
        IF done = 1 THEN LEAVE read_loop; END IF;
        UPDATE Employees SET Salary = vSalary + 1000 WHERE EmpID = vEmpID;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL IncreaseSalaryByCursor();
SELECT * FROM Employees;
