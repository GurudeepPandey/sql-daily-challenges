
-- DAY - 4:
-- Practice filtering, sorting and pattern matching.
-- (Where, And, Or, Between, In, Like, Distinct, Limit, Order By)

USE college_db;
-- 1. Retrieve all students from the 'CSE' department.
SELECT * FROM students WHERE department = 'CSE';

-- 2. Get students older than 20.
SELECT * FROM students WHERE age > 20;

-- 3. Display all teachers teaching 'Math'.
SELECT * FROM teachers WHERE subject = 'Math';

-- 4. Show all students whose age is not 18.
SELECT * FROM students WHERE age != 18;
SELECT * FROM students WHERE age <> 18;

-- 5. Retrieve distinct departments from the students table.
SELECT DISTINCT(department) FROM students;

-- 6. Get all students whose age is between 18 and 37.
SELECT * FROM students WHERE age BETWEEN 18 AND 36;

-- 7. Display names of teachers whose salary is more than 50,000.
SELECT name FROM teachers WHERE salary > 50000;

-- 8. Retrieve all students sorted by name alphabetically.
SELECT * FROM students ORDER BY name ASC;
SELECT * FROM students ORDER BY name DESC;

-- 9. Show the first 2 students from the table.
SELECT * FROM students LIMIT 2;

-- 10. Retrieve students whose name starts with 'D'.
SELECT * FROM students WHERE name LIKE 'D%';
SELECT * FROM students WHERE name LIKE '_e%';

-- 11. Get students from 'CSE' or 'ECE' departments.
SELECT * FROM students WHERE department IN ('CSE', 'ECE');

-- 12. Display teachers whose subject is 'Math' and salary > 50000.
SELECT * FROM teachers WHERE subject = 'Math' AND salary > 50000;

-- 13. Retrieve students whose name ends with 'n'.
SELECT * FROM students WHERE name LIKE '%n';

-- 14. Show all teachers with salary not between 40000 and 60000.
SELECT * FROM teachers WHERE salary NOT BETWEEN 40000 AND 60000;

-- 15. Get all students whose department is in ('CSE', 'IT', 'EEE').
SELECT * FROM students where department IN ('CSE', 'IT', 'EEE');

-- 16. Retrieve the top 3 youngest students.
SELECT * FROM students ORDER BY age ASC LIMIT 3;

-- 17. Show students whose name has 'ra' anywhere.
SELECT * FROM students WHERE name LIKE '%ra%';

-- 18. Get all teachers ordered by salary descending.
SELECT * FROM teachers ORDER BY salary DESC;

-- 19. Display students whose email contains 'gmail'.
SELECT * FROM students WHERE email LIKE '%gmail%';

-- 20. Retrieve all students not from 'CSE' and age > 20.
SELECT * FROM students WHERE department <> 'CSE' AND age > 20;

-- 21. Retrieve students whose name starts with 'S' and department = 'EEE'.
SELECT * FROM students WHERE name LIKE 's%' AND department = 'EEE';

-- 22. Display teachers whose name contains 'an' and salary < average salary.
SELECT * FROM teachers WHERE name LIKE '%an%' AND salary < (SELECT AVG(salary) FROM teachers);

-- 23. Get all students sorted by department ascending and age descending.
SELECT * FROM students ORDER BY department ASC, age DESC;

-- 24. Retrieve students from 'CSE' whose age is either 18, 20, or 22.
SELECT * FROM students WHERE department = 'CSE' AND age IN (18, 20, 22);

-- 25. Show students whose email does not contain '@' (invalid emails).
SELECT * FROM students WHERE email NOT LIKE '%@%';

-- 26. Get distinct ages of all students.
SELECT DISTINCT age FROM students;

-- 27. Display teachers who don’t teach 'Math' or 'Physics'.
SELECT * FROM teachers WHERE subject NOT IN ('Math', 'Physics');

-- 28. Retrieve all students whose name length > 5.
SELECT * FROM students WHERE LENGTH(name) > 5;

-- 29. Get top 3 highest-paid teachers in descending order.
SELECT * FROM teachers ORDER BY salary DESC LIMIT 3;