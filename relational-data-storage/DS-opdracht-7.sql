DELIMITER $$
DROP TRIGGER IF EXISTS fired;
CREATE TRIGGER fired
    AFTER UPDATE 
    ON employees
    FOR EACH ROW
BEGIN
    IF !(NEW.date_fired <=> OLD.date_fired) THEN
		INSERT INTO employeeArchive
			(employeeNumber, lastName, firstName, date_hired, date_fired)
			VALUES (OLD.employeeNumber, OLD.lastName, OLD.firstName, OLD.date_hired, NEW.date_fired);
    END IF;
END$$    


DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS checkIfFired;
CREATE FUNCTION checkIfFired(
    employee INT
)
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	IF (SELECT date_fired FROM employees WHERE employeeNumber = employee) IS NULL
    THEN RETURN ('');
    ELSE RETURN ('FIRED');
    END IF;
END $$

DELIMITER ;

DELIMITER $$

DROP VIEW IF EXISTS v_employeeStatus;
CREATE VIEW v_employeeStatus
AS
SELECT employeeNumber, lastName, firstName, checkIfFired(employeeNumber)
FROM employees
$$ 

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_giveRaise;
CREATE PROCEDURE p_giveRaise()
BEGIN
    UPDATE employees
    SET salary = salary * 1.05
    WHERE date_fired = NULL;  
END$$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_removeFired;
CREATE PROCEDURE p_removeFired()
BEGIN
    DELETE FROM employees
    WHERE NOT date_fired = NULL;  
END$$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS archiveSalary;
CREATE TRIGGER archiveSalary
    AFTER UPDATE 
    ON employees
    FOR EACH ROW
BEGIN
    IF !(NEW.salary <=> OLD.salary) THEN
		INSERT INTO salaryArchive
			(employeeNumber, lastName, firstName, oldSalary, newSalary)
			VALUES (OLD.employeeNumber, OLD.lastName, OLD.firstName, OLD.salary, NEW.salary);
    END IF;
END$$    

DELIMITER ;

CALL giveRaise()