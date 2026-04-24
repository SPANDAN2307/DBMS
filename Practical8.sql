DROP TABLE IF EXISTS audit_abc;
DROP TABLE IF EXISTS table_abc;

CREATE TABLE table_abc (
    id INT PRIMARY KEY,
    info VARCHAR(50),
    val DECIMAL(10,2)
);

INSERT INTO table_abc VALUES (123, 'abc', 123.00), (345, 'xyz', 345.00);

CREATE TABLE audit_abc (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    id INT,
    old_val DECIMAL(10,2),
    new_val DECIMAL(10,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_abc;

DELIMITER //
CREATE TRIGGER trg_abc
AFTER UPDATE ON table_abc
FOR EACH ROW
BEGIN
    IF OLD.val <> NEW.val THEN
        INSERT INTO audit_abc (id, old_val, new_val)
        VALUES (OLD.id, OLD.val, NEW.val);
    END IF;
END //
DELIMITER ;

UPDATE table_abc SET val = val + 123 WHERE id = 123;
SELECT * FROM table_abc;
SELECT * FROM audit_abc;
