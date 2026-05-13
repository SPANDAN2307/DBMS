DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    info VARCHAR(50),
    val INT
);

DROP TRIGGER IF EXISTS check_val_before_insert;

DELIMITER //

CREATE TRIGGER check_val_before_insert
BEFORE INSERT ON table_abc
FOR EACH ROW
BEGIN
    IF NEW.val < 0 THEN
        SET NEW.val = 0;
    END IF;
END //

DELIMITER ;

INSERT INTO table_abc VALUES (1, 'abc', 50);
INSERT INTO table_abc VALUES (2, 'xyz', -10);

SELECT * FROM table_abc;
