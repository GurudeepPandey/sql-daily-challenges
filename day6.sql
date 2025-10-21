
-- DAY - 6:
-- Grouping & Filtering with GROUP BY + HAVING practice.


USE college_db;
-- 1️. Count number of students in each department.
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department;

-- 2️. Find average age of students per department.
SELECT department, AVG(age) AS avg_age FROM students GROUP BY department;

-- 3️. Count total teachers per subject.
SELECT subject, COUNT(*) AS total_teachers FROM teachers GROUP BY subject;

-- 4️. Find maximum salary per subject.
SELECT subject, MAX(salary) AS max_salary FROM teachers GROUP BY subject;

-- 5️. Find minimum salary per subject.
SELECT subject, MIN(salary) AS min_salary FROM teachers GROUP BY subject;

-- 6️. Total number of courses each student is enrolled in.
SELECT student_id, COUNT(course_id) AS total_courses FROM enrollments GROUP BY student_id;

-- 7️. Count students older than 20 in each department.
SELECT department, COUNT(*) FROM students WHERE age > 20 GROUP BY department;

-- 8️. Show total credits assigned to each course (assuming multiple sections).
SELECT course_id, SUM(credits) AS total_credits FROM course GROUP BY course_id;

-- 9️. Count how many students have the same age.
SELECT age, COUNT(*) FROM students GROUP BY age;

-- 10. Count students whose name starts with 'D' per department.
SELECT department, COUNT(*) AS total_students FROM students WHERE name LIKE 'D%' GROUP BY department;

-- 11️. Departments with more than 2 students.
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department HAVING COUNT(*) > 2;

-- 12️. Subjects with average salary > 50000.
SELECT subject, AVG(salary) AS avg_salary FROM teachers GROUP BY subject HAVING AVG(salary) > 50000;

-- 13️. Students enrolled in more than 2 courses.
SELECT student_id, COUNT(course_id) AS total_courses FROM enrollments GROUP BY student_id HAVING COUNT(course_id) > 2;

-- 14️. Departments with students having average age < 22.
SELECT department, AVG(age) FROM students GROUP BY department HAVING AVG(age) < 22;

-- 15️. Courses with more than 5 enrolled students.
SELECT course_id, COUNT(student_id) AS total_students FROM enrollments GROUP BY course_id HAVING COUNT(student_id) > 5;

-- 16. Students with the same age appearing more than once.
SELECT age, COUNT(*) FROM students GROUP BY age HAVING COUNT(*) > 1;

-- 17. Departments having maximum age > 25.
SELECT department, MAX(age) FROM students GROUP BY department HAVING MAX(age) > 25;
