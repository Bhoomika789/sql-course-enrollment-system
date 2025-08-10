-- insert_data.sql
USE course_enrollment;

-- Instructors
INSERT INTO instructors (name, email, specialization) VALUES
('Dr. Asha Rao', 'asha.rao@example.com', 'Data Science'),
('Rahul Mehta', 'rahul.mehta@example.com', 'Java Development'),
('Priya Singh', 'priya.singh@example.com', 'Web Development'),
('Karan Patel', 'karan.patel@example.com', 'Cloud Computing'),
('Meera Iyer', 'meera.iyer@example.com', 'Machine Learning');

-- Courses
INSERT INTO courses (title, description, category, instructor_id, start_date, end_date, max_seats, price) VALUES
('Intro to SQL', 'Learn SQL fundamentals: SELECT, JOIN, GROUP BY, and more.', 'Database', 1, '2025-09-01', '2025-10-01', 30, 49.99),
('Advanced SQL & Optimization', 'Indexes, EXPLAIN, query tuning, window functions.', 'Database', 1, '2025-10-05', '2025-11-05', 25, 99.99),
('Java Programming Basics', 'Core Java concepts and hands-on examples.', 'Programming', 2, '2025-08-15', '2025-09-15', 40, 39.99),
('Full-Stack Web Dev', 'HTML, CSS, JS, Node.js and databases.', 'Web', 3, '2025-09-10', '2025-11-10', 35, 149.99),
('AWS Cloud Foundations', 'Cloud concepts and AWS fundamentals.', 'Cloud', 4, '2025-09-20', '2025-10-20', 30, 129.99),
('Machine Learning 101', 'Intro to ML algorithms and workflows.', 'AI', 5, '2025-10-01', '2025-12-01', 20, 199.99),
('React for Beginners', 'Build interactive UIs using React.', 'Web', 3, '2025-08-25', '2025-09-25', 30, 79.99),
('Capstone Project Course', 'Project-oriented course integrating skills.', 'Project', 2, '2025-11-01', '2025-12-15', 15, 249.99);

-- Students
INSERT INTO students (name, email, date_of_birth) VALUES
('Amit Kumar', 'amit.kumar@example.com', '1998-03-12'),
('Sneha Verma', 'sneha.verma@example.com', '2000-07-22'),
('Rahul Sharma', 'rahul.sharma@example.com', '1995-01-30'),
('Divya Menon', 'divya.menon@example.com', '1997-11-05'),
('Vikram Joshi', 'vikram.joshi@example.com', '1992-05-18'),
('Nisha Rao', 'nisha.rao@example.com', '1999-04-02'),
('Suman Gupta', 'suman.gupta@example.com', '1996-12-12'),
('Kriti Desai', 'kriti.desai@example.com', '1994-08-08'),
('Arjun Mehra', 'arjun.mehra@example.com', '2001-02-14'),
('Pooja Nair', 'pooja.nair@example.com', '1993-09-21');

-- Enrollments (some with payments later)
INSERT INTO enrollments (student_id, course_id, enrollment_date, status) VALUES
(1, 1, '2025-07-01 10:00:00', 'Active'),
(2, 1, '2025-07-02 11:00:00', 'Active'),
(3, 2, '2025-07-03 12:00:00', 'Active'),
(4, 3, '2025-07-04 13:00:00', 'Active'),
(5, 4, '2025-07-05 14:00:00', 'Active'),
(6, 5, '2025-07-06 15:00:00', 'Active'),
(7, 6, '2025-07-07 16:00:00', 'Active'),
(8, 7, '2025-07-08 17:00:00', 'Active'),
(9, 8, '2025-07-09 18:00:00', 'Active'),
(10, 1, '2025-07-10 19:00:00', 'Active'),
(1, 2, '2025-07-11 09:30:00', 'Active'),
(2, 3, '2025-07-12 10:30:00', 'Active'),
(3, 4, '2025-07-13 11:30:00', 'Active'),
(4, 5, '2025-07-14 12:30:00', 'Dropped'),
(5, 6, '2025-07-15 13:30:00', 'Completed'),
(6, 1, '2025-07-16 14:30:00', 'Active'),
(7, 2, '2025-07-17 15:30:00', 'Active'),
(8, 3, '2025-07-18 16:30:00', 'Active'),
(9, 4, '2025-07-19 17:30:00', 'Active'),
(10, 5, '2025-07-20 18:30:00', 'Active');

-- Payments (some pending/paid)
INSERT INTO payments (enrollment_id, amount, payment_date, payment_method, status) VALUES
(1, 49.99, '2025-07-01 10:05:00', 'Card', 'Paid'),
(2, 49.99, '2025-07-02 11:05:00', 'UPI', 'Paid'),
(3, 99.99, '2025-07-03 12:05:00', 'Card', 'Paid'),
(4, 39.99, '2025-07-04 13:05:00', 'NetBanking', 'Paid'),
(5, 149.99, '2025-07-05 14:05:00', 'Card', 'Paid'),
(6, 129.99, '2025-07-06 15:05:00', 'UPI', 'Paid'),
(7, 199.99, '2025-07-07 16:05:00', 'Card', 'Paid'),
(8, 79.99, '2025-07-08 17:05:00', 'UPI', 'Paid'),
(9, 249.99, '2025-07-09 18:05:00', 'Card', 'Paid'),
(10, 49.99, '2025-07-10 19:05:00', 'Card', 'Paid');
