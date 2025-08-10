-- views.sql
USE course_enrollment;

-- Active enrollments view
CREATE OR REPLACE VIEW v_active_enrollments AS
SELECT e.enrollment_id, s.student_id, s.name AS student_name, c.course_id, c.title AS course_title, e.enrollment_date
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.status = 'Active';

-- Course revenue view (paid)
CREATE OR REPLACE VIEW v_course_revenue AS
SELECT c.course_id, c.title, COALESCE(SUM(p.amount),0) AS total_paid_revenue
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN payments p ON e.enrollment_id = p.enrollment_id AND p.status = 'Paid'
GROUP BY c.course_id, c.title;
