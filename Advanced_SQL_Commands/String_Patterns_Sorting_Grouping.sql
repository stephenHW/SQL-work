--------------------------------------------------------------------
--String Patterns, Sorting & Grouping--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Work with string patterns in data from database
--  Sort and group the data in the database

--Note: We will be using data that was inserted into tables created by HR_Database_Create_Tables_Script.sql script. Will provide proper CSV files in folder.
--Note: CSV files were loaded into datatables that are on the IBM db2 server. Refer to steps on how to complete such a load. 

-------------------------------------------------------
--Composing and Running Queries--
-------------------------------------------------------

--Query 1: 

--Retrieve all employees whos address is in Elgin, IL

SELECT f_name, l_name, address FROM employees
WHERE address LIKE '%Elgin,IL%'
;

--Query 2: 

--Retrieve all employees who were born during the 1970s

SELECT f_name, l_name, b_date FROM employees
WHERE b_date LIKE '197%'
;

--Query 3:

--Retrieve all employees in department 5 whos salary is between 60000 & 70000

SELECT * FROM employees
	WHERE dep_id = 5 
	AND salary BETWEEN 60000 AND 70000
;

--Query 4A: 

--Retrieve a list of employees ordered by department ID

SELECT f_name, l_name, dep_id FROM employees
	ORDER BY dep_id
;

--Query 4B:

--Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically by last namen in descending order

SELECT l_name, f_name, dep_id FROM employees
	ORDER BY dep_id DESC, l_name DESC
;

--Query 5A:

--Retrieve the number of employees in each department

SELECT dep_id, COUNT(dep_id) AS employee_count FROM employees
	GROUP BY dep_id
;

--Query 5B:

--Retrieve the number of employees in each department and the average salary per department

SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) AS avg_salary FROM employees
	GROUP BY dep_id
;

--Query 5C: 

--Order the above query by avg_salary

SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) AS avg_salary FROM employees
	GROUP BY dep_id
	ORDER BY avg_salary
;

--Query 5D:

--Limit the above query to departments with fewer than 4 employees 

SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) AS avg_salary FROM employees
	GROUP BY dep_id
	HAVING COUNT(dep_id) < 4
	ORDER BY avg_salary
;

--Query 6:

--Order the table by department name instead of department id

SELECT d.dep_name, e.f_name, e.l_name FROM employees e, departments d
	WHERE e.dep_id = d.dept_id_dep
	ORDER BY d.dep_name
;