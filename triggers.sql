-- triggers.sql
USE course_enrollment;
DELIMITER $$

-- Trigger to create a pending payment record upon new enrollment
CREATE TRIGGER trg_after_enrollment
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    DECLARE course_price DECIMAL(10,2);
    SELECT price INTO course_price FROM courses WHERE course_id = NEW.course_id;
    IF course_price IS NULL THEN
        SET course_price = 0.00;
    END IF;
    INSERT INTO payments (enrollment_id, amount, status, payment_method)
    VALUES (NEW.enrollment_id, course_price, 'Pending', 'Not Set');
END$$

DELIMITER ;
