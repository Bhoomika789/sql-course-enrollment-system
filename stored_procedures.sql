-- stored_procedures.sql
USE course_enrollment;
DELIMITER $$

-- Procedure to enroll a student if seats are available and not already enrolled
CREATE PROCEDURE sp_enroll_student (
    IN p_student_id INT,
    IN p_course_id INT,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_enrolled INT DEFAULT 0;
    DECLARE v_max_seats INT DEFAULT 0;

    -- Check if already enrolled
    SELECT COUNT(*) INTO v_enrolled FROM enrollments
    WHERE student_id = p_student_id AND course_id = p_course_id;

    IF v_enrolled > 0 THEN
        SET p_message = 'Student already enrolled in this course.';
        LEAVE proc_end;
    END IF;

    -- Check seats
    SELECT max_seats INTO v_max_seats FROM courses WHERE course_id = p_course_id;
    SELECT COUNT(*) INTO v_count FROM enrollments WHERE course_id = p_course_id AND status = 'Active';

    IF v_count >= v_max_seats THEN
        SET p_message = 'Course is full.';
        LEAVE proc_end;
    END IF;

    -- Enroll student
    INSERT INTO enrollments (student_id, course_id) VALUES (p_student_id, p_course_id);
    SET p_message = 'Enrollment successful.';

    proc_end: BEGIN END;
END$$

DELIMITER ;
