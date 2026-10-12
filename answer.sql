-- Week 1 Database Assignment
-- Topic: School Management System
-- Description: Creates a database to manage students, courses, and enrollments.

CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

-- Store student details.
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE,
    enrolled_on DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Store the courses offered by the school.
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- Connect students to the courses they take.
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (student_id, course_id)
);

-- Example records (optional; remove these INSERT statements if you want an empty database).
INSERT INTO students (first_name, last_name, email, date_of_birth)
VALUES
    ('Amina', 'Otieno', 'amina.otieno@example.com', '2005-04-12'),
    ('Brian', 'Kamau', 'brian.kamau@example.com', '2004-09-23');

INSERT INTO courses (course_name, course_code, description)
VALUES
    ('Introduction to Computing', 'ICT101', 'Basic computer and information technology skills'),
    ('Database Fundamentals', 'DBS101', 'Introduction to relational databases and SQL');

INSERT INTO enrollments (student_id, course_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2);

-- Check the records created.
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
