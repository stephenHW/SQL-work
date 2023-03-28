--------------------------------------------------------------------
--Sub-queries and Nested SELECTs--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Write SQL queries that demonstrate the necessity of using sub-queries
--  Compose sub-queries in the where clause
--	Build Column Expressions (i.e. sub-query in place of a column)
--	Write Table Expressions (i.e. sub-query in place of a table)

--Note: We will be using data that was inserted into tables created by HR_Database_Create_Tables_Script.sql script. Will provide proper CSV files in folder.
--Note: CSV files were loaded into datatables that are on the IBM db2 server. Refer to steps on how to complete such a load. 

-------------------------------------------------------
--Composing and Running Queries--
-------------------------------------------------------


--Problem 1:

--Execute a failing query which attempts to retrive all employees who have an below average salary

SELECT * FROM employees
	WHERE salary < AVG(salary)
;

--Problem 2:

--Execute a working query which retrieves all employees who have a below average salary

SELECT * FROM employees
	WHERE salary < (SELECT AVG(salary) FROM employees)
;

--Problem 3:

--Execute a failing query that attempts to retrieve all employees records for the employee id and salary columns as well as
--a column that repeats the max salary for each row in the table

SELECT emp_id, salary, MAX(salary) AS max_salary FROM employees
;

--Problem 4:

--Retrieve all employees records for the employee id and salary columns as well as a column that repeats the max salary for each row in the table

SELECT emp_id, salary,
	(SELECT MAX(salary) FROM employees) AS max_salary
	FROM employees
;

--Problem 5:

--Execute a table expression for the EMPLOYEE table that excludes columns with sensitive information

SELECT * FROM 
	(SELECT emp_id, f_name, l_name, dep_id FROM employees) AS emp4all
;