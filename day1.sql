
-- DAY - 1:
-- Database basics, Tables and Data Types


-- Table Creation & Schema Design
-- 1. Create a database named college_db.
CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

-- 2. Create a table named students with columns:
CREATE TABLE students (
	student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT,
    department VARCHAR(30)
);

-- 3. Create a table teachers with these fields:
CREATE TABLE teachers (
	teacher_id INT,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(20) NOT NULL,
    salary DECIMAL(10,2)
);

-- 4. Create a table courses with columns:
CREATE TABLE course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(25) NOT NULL,
    credits INT CHECK (credits between 1 AND 6)
);

-- 5. Create a table enrollments to link students and courses. Include:
CREATE TABLE enrollments (
	enrollement_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);


-- Data Types Practice
-- 6. Create a table library_books with:
CREATE TABLE library_books (
	book_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(20),
    price DECIMAL(6,2),
    available BOOLEAN DEFAULT TRUE
);

-- 7. Create a table attendance with:
CREATE TABLE attendance (
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    status CHAR(1) CHECK (status IN ('P', 'A')),
    student_id INT
);

-- 8. Create a table fees with:
CREATE TABLE fees (
	fee_id INT PRIMARY KEY,
    amount FLOAT,
    paid_on DATETIME
);


-- Constraints Practice
-- 9. Add a NOT NULL constraint on student.name and email.
ALTER TABLE students MODIFY COLUMN name VARCHAR(50) NOT NULL;
ALTER TABLE students MODIFY COLUMN email VARCHAR(50) UNIQUE NOT NULL;

-- 10. Add a DEFAULT value 'CSE' for column student.department.
ALTER TABLE students MODIFY COLUMN department VARCHAR(30) DEFAULT 'CSE';

-- 11. Add a CHECK constraint so that age must be ≥ 18.
ALTER TABLE students ADD CONSTRAINT check_age CHECK (age > 18);

-- 12. Add a UNIQUE constraint on email.
ALTER TABLE students ADD CONSTRAINT unique_email_constraint UNIQUE (email);

-- 13. Add a PRIMARY KEY constraint to teacher_id.
ALTER TABLE teachers ADD PRIMARY KEY (teacher_id);
ALTER TABLE teachers
ADD CONSTRAINT pk_teacher
PRIMARY KEY (teacher_id);

-- 14. Add a FOREIGN KEY constraint on enrollments.student_id referencing students.student_id.
ALTER TABLE enrollments ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE enrollments
ADD CONSTRAINT fk_enroll_student
FOREIGN KEY (student_id)
REFERENCES students(student_id);

-- 15. Add another FOREIGN KEY on enrollments.course_id referencing courses.course_id.
ALTER TABLE enrollments ADD FOREIGN KEY (course_id) REFERENCES course(course_id);
ALTER TABLE enrollments
ADD CONSTRAINT fk_enroll_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);


-- Schema Inspection & Basic Operations
-- 16. Write a query to show all databases available in your server.
SHOW DATABASES;

-- 17. Write a query to switch to college_db.
USE college_db;

-- 18. Write a query to show all tables in college_db.
SHOW TABLES;

-- 19. Write a query to describe the structure of the students table.
DESCRIBE students;

-- 20. Write a query to delete (drop) the fees table.
DROP TABLE IF EXISTS fees;