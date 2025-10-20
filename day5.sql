
-- DAY - 5:
-- Practice Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)

USE college_db;
-- 1. Count total number of students in the table.
SELECT COUNT(*) AS total_students FROM students;

-- 2. Count total number of teachers.
SELECT COUNT(*) AS total_teachers FROM teachers;

-- 3. Find total number of students in each department.
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department;

-- 4. Find average age of all students.
SELECT AVG(age) AS avg_age FROM students;

-- 5. Find highest salary among teachers.
SELECT MAX(salary) AS highest_salary FROM teachers;

-- 6. Find lowest salary among teachers.
SELECT MIN(salary) AS lowest_salary FROM teachers;

-- 7. Find total sum of all teacher salaries.
SELECT SUM(salary) AS total_salary FROM teachers;

-- 8. Get the average salary of teachers.
SELECT AVG(salary) AS avg_salary FROM teachers;

-- 9. Count how many students are from the ‘CSE’ department.
SELECT COUNT(*) AS CSE_students FROM students WHERE department = 'CSE';

-- 10. Find total number of unique departments.
SELECT COUNT(DISTINCT department) AS total_departments FROM students;

-- 11. Find average age of students for each department.
SELECT department, AVG(age) AS avg_age FROM students GROUP BY department;

-- 12. Count how many teachers teach each subject.
SELECT subject, COUNT(*) AS total_teachers FROM teachers GROUP BY subject;

-- 13. Find total salary paid to teachers in each subject.
SELECT subject, SUM(salary) AS total_salary FROM teachers GROUP BY subject;

-- 14. Show the maximum and minimum age of students in the ‘IT’ department.
SELECT MAX(age), MIN(age) FROM students WHERE department = 'CSE';

-- 15. Find the total number of students whose age > 20.
SELECT COUNT(*) FROM students WHERE age > 20;

-- 16. Display average salary of teachers who earn more than 40000.
SELECT AVG(salary) FROM teachers WHERE salary > 40000;

-- 17. Find departments having more than 1 students. (Use HAVING)
SELECT department, COUNT(*) AS total_students FROM students GROUP BY department HAVING COUNT(*) > 1;

-- 18. Show teacher(s) with the highest salary. (Use MAX() with subquery)
SELECT * FROM teachers WHERE salary = (SELECT MAX(salary) FROM teachers);

-- 19️. Find department(s) where the average age of students is above 21.
SELECT department, AVG(age) AS avg_age FROM students GROUP BY department HAVING AVG(age) > 21;

-- 20️. Find the difference between the highest and lowest teacher salary. (Use MAX() - MIN())
SELECT (MAX(salary) - MIN(salary)) AS salary_difference FROM teachers;