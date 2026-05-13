DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    info VARCHAR(50),
    val INT
);

INSERT INTO table_abc VALUES (1, 'abc', 100);
INSERT INTO table_abc VALUES (2, 'xyz', 200);

DROP PROCEDURE IF EXISTS proc_abc;

DELIMITER //

CREATE PROCEDURE proc_abc()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_val INT;
    DECLARE cur CURSOR FOR SELECT id, val FROM table_abc;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_val;
        IF done = 1 THEN LEAVE read_loop; END IF;
        
        UPDATE table_abc SET val = v_val + 50 WHERE id = v_id;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;

CALL proc_abc();
SELECT * FROM table_abc;
