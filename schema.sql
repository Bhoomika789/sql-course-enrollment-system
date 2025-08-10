-- schema.sql
-- MySQL schema for SQL Course Enrollment System

CREATE DATABASE IF NOT EXISTS course_enrollment;
USE course_enrollment;

-- Students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    date_of_birth DATE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Instructors table
CREATE TABLE IF NOT EXISTS instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    specialization VARCHAR(100)
) ENGINE=InnoDB;

-- Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    instructor_id INT,
    start_date DATE,
    end_date DATE,
    max_seats INT DEFAULT 50,
    price DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Enrollments table
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Active','Completed','Dropped') DEFAULT 'Active',
    UNIQUE KEY uq_student_course (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Payments table
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Indexes for performance
CREATE INDEX idx_students_email ON students(email);
CREATE INDEX idx_instructors_email ON instructors(email);
CREATE INDEX idx_courses_category ON courses(category);
