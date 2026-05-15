DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

INSERT INTO Employees VALUES (1, 'Alice', 60000);
INSERT INTO Employees VALUES (2, 'Bob', 55000);

DROP PROCEDURE IF EXISTS apply_bonus;

DELIMITER //

CREATE PROCEDURE apply_bonus()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_salary INT;
    DECLARE cur CURSOR FOR SELECT emp_id, salary FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_salary;
        IF done = 1 THEN LEAVE read_loop; END IF;
        
        UPDATE Employees SET salary = v_salary + 500 WHERE emp_id = v_id;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;

CALL apply_bonus();
SELECT * FROM Employees;
