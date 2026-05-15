DROP TABLE IF EXISTS Bank_Accounts;

CREATE TABLE Bank_Accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance INT
);

DROP TRIGGER IF EXISTS prevent_negative_balance;

DELIMITER //

CREATE TRIGGER prevent_negative_balance
BEFORE INSERT ON Bank_Accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0 THEN
        SET NEW.balance = 0;
    END IF;
END //

DELIMITER ;

INSERT INTO Bank_Accounts VALUES (1, 'Alice', 5000);
INSERT INTO Bank_Accounts VALUES (2, 'Bob', -100);

SELECT * FROM Bank_Accounts;
