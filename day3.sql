
-- DAY - 3:
-- Learn and practice DML Commands (Select, Insert, Update, Delete)


USE college_db;
-- 1. Insert 5 students into the students table.
INSERT INTO students (student_id, name, email, age, department) VALUES
(1, 'Dhoni', 'dhoni@gmail.com', 46, 'CSE'),
(2, 'Virat', 'virat@ai.com', 36, 'Civil'),
(3, 'Rohit', 'rohit@g.com', 37, 'ECE'),
(4, 'Simran', 'simran@mail.com', 22, 'EEE'),
(5, 'Dev', 'dev@mail.com', 18, 'CSE');

-- 2. Insert 3 teachers into the teachers table.
INSERT INTO teachers VALUES 
(1, 'Mr. Sharma', 'Math', 50000),
(2, 'Ms. Gupta', 'Physics', 55000),
(3, 'Mr. Khan', 'CS', 60000);

-- 3. Retrieve all records from the students table.
SELECT * FROM students;

-- 4. Retrieve only name and department of all students.
SELECT name, department FROM students;

-- 5. Show all students whose department is 'CSE'.
SELECT * FROM students WHERE department = 'CSE';

-- 6. Update the age of student with student_id = 3 to 21.
UPDATE students SET age = 21 WHERE student_id = 3;

-- 7. Increase the salary of all teachers by 10%.
SET SQL_SAFE_UPDATES = 0;
UPDATE teachers SET salary = salary * 1.10;

-- 8. Delete the student with student_id = 5.
DELETE FROM students where student_id = 5;

-- 9. Delete all teachers whose salary is below 40000.
INSERT INTO teachers VALUES
(4, 'Aman', 'Math', 35000),
(5, 'Akash', 'Hindi', 39000),
(6, 'Ankit', 'GK', 40000);
DELETE FROM teachers WHERE salary < 40000;

-- 10. Retrieve all students sorted by age in descending order.
SELECT * FROM students ORDER BY age DESC;

-- 11. Retrieve students whose age is between 18 and 22 and department is 'ECE'.
SELECT * FROM students WHERE age BETWEEN 18 AND 22 AND (department = 'ECE');

-- 12. Select all teachers whose subject is 'Math' or 'Physics'.
SELECT * FROM teachers WHERE subject IN ('Math', 'Physics');

-- 13. Show only the name and salary of teachers earning more than 50000.
SELECT name, salary FROM teachers WHERE salary > 50000;

-- 14. Insert a new student without specifying the department — check if the default value ('CSE') applies.
ALTER TABLE students MODIFY COLUMN department VARCHAR(30) DEFAULT 'CSE';
INSERT INTO students (student_id, name, email, age) VALUES
(15, 'Aman', 'aman@g.com', 29);

-- 15. Update all students from 'EEE' department to 'Electrical'.
UPDATE students SET department = 'Electrical' WHERE department = 'EEE';

-- 16. Delete students who have NULL values in the department column.
DELETE FROM students WHERE department IS NULL;

-- 17. Retrieve the total number of students in each department.
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department;

-- 18. Show the average salary of teachers in each subject.
SELECT subject, AVG(salary) AS average_salary FROM teachers GROUP BY subject;

-- 19. Display names of students enrolled in at least one course (use enrollments table with a JOIN).
SELECT name FROM students WHERE student_id IN (SELECT student_id FROM enrollments);
SELECT name FROM students NATURAL JOIN enrollments;
SELECT s.name FROM students s JOIN enrollments e ON s.student_id = e.student_id;

-- 20. Delete all students who are not enrolled in any course.
--      (Hint: use NOT IN with a subquery)
DELETE FROM students WHERE student_id NOT IN (SELECT student_id FROM enrollments);

-- 21. Write a single query that increases the salary of all teachers in the 'IT' department by 15%, but only if their salary is below the average salary of all teachers.
UPDATE teachers
SET salary = salary * 1.15
WHERE subject = 'IT' AND salary < (SELECT AVG(salary) FROM teachers);