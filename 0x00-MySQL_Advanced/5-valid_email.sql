-- Creates a trigger tha resets the attribute valid_email only when the email has been changed
DELIMITER //
CREATE TRIGGER resets_email
BEFORE UPDATE
ON users
FOR EACH ROW
	BEGIN
		-- Resetting valid_email
                IF NEW.email <> OLD.email THEN
			SET NEW.valid_email = 0;
		END IF;
                
	END //
DELIMITER ;
