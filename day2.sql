
-- DAY - 2:
-- Practice SQL DDL Commands (CREATE, ALTER, DROP, TRUNCATE, DELETE, RENAME)
-- Learn how to modify schema


USE college_db;
-- 1. Create a table named departments:
CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- 2. Add a new column head_of_department (VARCHAR 50) to the departments table.
ALTER TABLE departments ADD COLUMN head_of_department VARCHAR(50);

-- 3. Rename the column head_of_department to hod_name.
ALTER TABLE departments RENAME COLUMN head_of_department to hod_name;

-- 4. Delete the column location from the departments table.
ALTER TABLE departments DROP COLUMN location;

-- 5. Change the data type of dept_name from VARCHAR(50) to VARCHAR(100).
ALTER TABLE departments MODIFY COLUMN dept_name VARCHAR(100);

-- 6. Create a new table named old_students:
CREATE TABLE old_students (
	id INT,
    name VARCHAR(50),
    passed_year INT,
    cgpa DECIMAL(2,2)
);

-- 7. Rename the table old_students to alumni.
ALTER TABLE old_students RENAME TO alumni;
RENAME TABLE alumni TO old_students;

-- 8. Drop the table alumni.
DROP TABLE alumni;

-- 9. Create a table named temp_data with some dummy columns, then truncate it to remove all rows.
CREATE TABLE temp_data (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO temp_data (id, name) VALUES
(1, "John Doe"),
(2, "Harry Brook"),
(3, "Ben Stockes"),
(4, "Joe Root");
TRUNCATE TABLE temp_data;

-- 10. Create a table test_delete with 3 rows of dummy data. Then delete all rows using the DELETE command.
CREATE TABLE test_delete (
	id INT,
    name VARCHAR(50)
);
INSERT INTO test_delete (id, name) VALUES
(1, "Virat Kohli"),
(2, "Dhoni"),
(3, "Rohit Sharma");
SET SQL_SAFE_UPDATES = 0;
DELETE FROM test_delete;

-- 11. Create a table employees with columns:
CREATE TABLE employees (
	emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(20),
    salary DECIMAL(10,2)
);

-- 12. Insert 5 records into employees.
INSERT INTO employees VALUES
(1,'A','HR',40000),
(2,'B','IT',50000),
(3,'C','Sales',45000),
(4,'D','IT',60000),
(5,'E','Admin',35000);

-- 13. Increase the size of the department column to VARCHAR(100).
ALTER TABLE employees MODIFY COLUMN department VARCHAR(100);

-- 14. Add a new column joining_date (DATE) to the employees table.
ALTER TABLE employees ADD COLUMN joining_date DATE;

-- 15. Rename the employees table to company_employees.
ALTER TABLE employees RENAME TO company_employees;
RENAME TABLE employees TO company_employees;

-- 16. Create a table projects:
CREATE TABLE projects (
	project_id INT PRIMARY KEY,
    project_name VARCHAR(30),
    emp_id INT
);

-- 17. Add a FOREIGN KEY constraint to projects.emp_id referencing company_employees.emp_id.
ALTER TABLE projects ADD CONSTRAINT fk_emp FOREIGN KEY(emp_id) REFERENCES company_employees(emp_id);

-- 18. You realize the constraint name should be more descriptive — rename the constraint to fk_projects_employee.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'projects';		-- show all constraints name and type
SHOW CREATE TABLE projects;			-- show table creation code
ALTER TABLE projects DROP CONSTRAINT fk_projects_employee;
ALTER TABLE projects ADD CONSTRAINT fk_projects_employee FOREIGN KEY(emp_id) REFERENCES company_employees(emp_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 19. Create a new table temporary_backup as a copy of company_employees (only structure, no data).
CREATE TABLE temporary_backup LIKE company_employees;

-- 20. Copy only the data (not the structure) from company_employees to another table named employee_archive.
CREATE TABLE employee_archive AS (SELECT * FROM company_employees WHERE 1 = 0);
INSERT INTO employee_archive (SELECT * FROM company_employees);

-- 21. Your boss wants to merge two departments, “IT” and “Tech Support”, into one named “Technical”. Write the SQL to update and then rename the table departments to dept_details.
UPDATE departments SET dept_name = 'Technical' WHERE dept_name IN ('IT', 'Tech Support');
RENAME TABLE departments TO dept_datails;

-- 22. You need to archive old records:
--		Create a table old_projects with the same structure as projects.
--		Move all projects with project_id > 5 from projects to old_projects, then delete them from projects.
CREATE TABLE old_projects LIKE projects;
INSERT INTO old_projects (SELECT * FROM projects WHERE project_id > 5);
DELETE FROM projects WHERE project_id > 5;

-- 23. Add a new column status (ENUM or VARCHAR 20) in projects with a default value 'Active'.
ALTER TABLE projects ADD COLUMN status VARCHAR(20) DEFAULT 'Active';

-- 24. The projects table has too much unused space — use the appropriate command to remove all rows quickly without deleting the table.
TRUNCATE TABLE projects;

-- 25. Finally, drop all the following tables in a single SQL statement:
-- 		projects, old_projects, company_employees, and departments (or dept_details if renamed).
DROP TABLE IF EXISTS projects, old_projects, company_employees, dept_details, employee_archive;