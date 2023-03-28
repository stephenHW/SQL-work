--------------------------------------------------------------------
--Working with Multiple Tables--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--  Write SQL queries that access more than one table
--  Compose queries that access multiple tables using a nested statement in the WHERE clause
--  Build queries with multiple tables in the FROM clause
--  Write Implicit Join queries with join criteria specified in the WHERE clause
--  Specify aliases for table names and qualify column names with table aliases

--Note: We will be using data that was inserted into tables created by HR_Database_Create_Tables_Script.sql script. Will provide proper CSV files in folder.
--Note: CSV files were loaded into datatables that are on the IBM db2 server. Refer to steps on how to complete such a load. 

-------------------------------------------------------
--Accessing Multiple Tables with Sub-Queries--
-------------------------------------------------------

--Problem 1: 

--Retrieves only the EMPLOYEES records that correspond to jobs in the JOBS table 

SELECT * FROM employees
	WHERE job_id IN
		(SELECT job_ident FROM jobs)
;

--Problem 2:

--Retrieves only a list of employees whos JOB_TITLE is Jr. Designer

SELECT * FROM employees
	WHERE job_id IN
		(SELECT job_ident FROM jobs
			WHERE LCASE(job_title) = 'jr. designer')
;

--Problem 3:

--Retrieves JOB information and who earned more than $70,000

SELECT * FROM jobs
	WHERE job_ident IN
		(SELECT job_id FROM employees
			WHERE salary > 70000)
;

--Problem 4:

--Retrieves JON information and whos birth year is after 1976

SELECT * FROM jobs
	WHERE job_ident IN
		(SELECT job_id FROM employees
			WHERE YEAR(b_date) > 1976)
;

--Problem 5:

--Retrieves JOB information for female employees whos birth year is after 1976

SELECT * FROM jobs
	WHERE job_ident IN
		(SELECT job_id FROM employees
			WHERE YEAR(b_date) > 1976 AND UCASE(sex) = 'F')
;

-------------------------------------------------------
--Accessing Multiple Tables with Implicit Joins--
-------------------------------------------------------

--Problem 1:

--Preforms an implicit cartesian/cross join between EMPLOYEES and JOBS tables

SELECT * FROM employees, jobs
;

--Problem 2: 

--Retrieves only the EMPLOYEES records that correspond to jobs in the JOBS table

SELECT e.* FROM employees e, jobs j
	WHERE e.job_id = j.job_ident
;

--Problem 3:

--Redoes previous query, but retrieve only emp_id, name, and job_title

SELECT e.emp_id, e.f_name, e.l_name, j.job_title FROM employees e, jobs j
	WHERE e.job_id = j.job_ident
;
