-- queries.sql
USE course_enrollment;

-- 1. List all students with the courses they are enrolled in
SELECT s.student_id, s.name AS student_name, c.course_id, c.title AS course_title, e.status, e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id;

-- 2. Courses with highest enrollment count
SELECT c.course_id, c.title, COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id AND e.status = 'Active'
GROUP BY c.course_id, c.title
ORDER BY enrollment_count DESC;

-- 3. Total revenue per course (only Paid payments)
SELECT c.course_id, c.title, COALESCE(SUM(p.amount),0) AS total_revenue
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN payments p ON e.enrollment_id = p.enrollment_id AND p.status = 'Paid'
GROUP BY c.course_id, c.title
ORDER BY total_revenue DESC;

-- 4. Students who haven't enrolled in any course
SELECT s.*
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 5. Find students enrolled in courses taught by 'Priya Singh'
SELECT DISTINCT s.student_id, s.name, c.title
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN instructors i ON c.instructor_id = i.instructor_id
WHERE i.name = 'Priya Singh';

-- 6. Use window function to show running total of payments per student (MySQL 8+)
SELECT p.payment_id, s.student_id, s.name, p.amount, p.payment_date,
       SUM(p.amount) OVER (PARTITION BY s.student_id ORDER BY p.payment_date) AS running_total
FROM payments p
JOIN enrollments e ON p.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
ORDER BY s.student_id, p.payment_date;
