--------------------------------------------------------------------
--Working with Real World Data Sets--
--------------------------------------------------------------------

-------------------------------------------------------
--Project Overview--
-------------------------------------------------------

--Describe and analyze the three following data sets: 
	--Socioeconomic Indicators in Chicago (CENSUS_DATA),
	--Chicago Public School Data (CHICAGO_PUBLIC_SCHOOLS),

-------------------------------------------------------
--Dataset Review and Familiarization--
-------------------------------------------------------

--Here includes a detailed description for each dataset. I will include each file in .csv format. 

------------------------------------------
--Socioeconomic Indicators in Chicago--
------------------------------------------

--This data set contains six selected socioeconomic indicators of public health and a one last column labeled "hardhship index",
--for each Chicago community area between the years 2008 and 2012. 


--Link to dataset: https://data.cityofchicago.org/Health-Human-Services/Census-Data-Selected-socioeconomic-indicators-in-C/kn9c-c2s2

------------------------------------------
--Chicago Public School Data--
------------------------------------------

--This data set shows all school level preformance data used to create Chicago Public School Report Cards for the 2011 - 2012 school year.  


--Link to dataset: https://data.cityofchicago.org/Education/Chicago-Public-Schools-Progress-Report-Cards-2011-/9xs2-f89t

-------------------------------------------------------
--DATA Cleaning--
-------------------------------------------------------

--Fix the truncation that occured to the following entry in the data table. We were notified of this error when we finished loading in the data. 

--1: Confirm the error is in the data set

SELECT name_of_school
	FROM CHICAGO_PUBLIC_SCHOOLS 
	WHERE name_of_school LIKE 'Rodolfo Lozano Bilingual & International Center Elementary%'
;

--2: Update the varchar size to account for longer values

ALTER TABLE chicago_public_schools 
	ALTER COLUMN name_of_school 
	SET DATA TYPE VARCHAR (70)
;

--3: Change the erronious truncation

UPDATE chicago_public_schools
	SET name_of_school = 'Rodolfo Lozano Bilingual & International Center Elementary School'
	WHERE name_of_school = 'Rodolfo Lozano Bilingual & International Center Elementary Schoo'
;  

-------------------------------------------------------
--Retrieve Table Meta Data--
-------------------------------------------------------

--Verify table creation was successful

SELECT tabschema, tabname, create_time FROM syscat.tables
	WHERE tabschema = 'PLL26714'
;

--Count the total number of columns in CHICAGO_PUBLIC_SCHOOLS

SELECT COUNT(*) FROM syscat.columns
	WHERE tabname = 'CHICAGO_PUBLIC_SCHOOLS'
;

--Retrieves a list of CHICAGO_PUBLIC_SCHOOLS & the corresponding data type

SELECT colname, typename, LENGTH FROM syscat.columns
	WHERE tabname = 'CHICAGO_PUBLIC_SCHOOLS'
;

-------------------------------------------------------
--Problems--
-------------------------------------------------------

--Problem 1: 

--Count the number of elementary schools in data set

SELECT COUNT(DISTINCT(name_of_school)) FROM chicago_public_schools
	WHERE UCASE(elementary__middle__or_high_school) = 'ES'
;

--Problem 2: 

--Identify the highest safety score achieved from all schools in the data set

SELECT MAX(safety_score) FROM chicago_public_schools
;

--Problem 3:

--Identify which schools have the highest safety score

SELECT name_of_school FROM chicago_public_schools
	WHERE safety_score = (SELECT MAX(safety_score) FROM chicago_public_schools)
;

--Problem 4: 

--Find the top 10 highest average student attendance from all schools

SELECT name_of_school, average_student_attendance FROM chicago_public_schools 
	ORDER BY average_student_attendance DESC NULLS LAST LIMIT 10
;

--Problem 5: 

--Find the bottom 5 lowest average student atttendance from all schools

SELECT name_of_school, average_student_attendance FROM chicago_public_schools 
	ORDER BY average_student_attendance NULLS LAST LIMIT 5
;

--Problem 6: 

--Removes the percentage sign within each row of the average student attendance column

SELECT name_of_school, 
	REPLACE(average_student_attendance, '%','') AS average_student_attendance
	FROM chicago_public_schools 
	ORDER BY average_student_attendance NULLS LAST LIMIT 5
;

--Problem 7:

--Finds all schools where the average attendance is below 70%

SELECT name_of_school, average_student_attendance
	FROM chicago_public_schools
	WHERE CAST(REPLACE(average_student_attendance, '%','') AS DOUBLE) < 70
;

--Problem 8: 

--Gets total college enrollment for each community area

SELECT community_area_name, SUM(college_enrollment) AS total_college_enrollment
	FROM chicago_public_schools
	GROUP BY community_area_name
;

--Problem 9:

--Gets 5 lowest college enrollment totals from each community area (Ascending Order)

SELECT community_area_name, SUM(college_enrollment) AS total_college_enrollment
	FROM chicago_public_schools
	GROUP BY community_area_name
	ORDER BY total_college_enrollment LIMIT 5
;

--Problem 10:

--Lists the 5 schools with the lowest safety score

SELECT name_of_school, safety_score
	FROM chicago_public_schools
	ORDER BY safety_score LIMIT 5
; 

--Problem 11:

--Retrieves the hardship index for a community with 4368 number of individuals enrolled in college

SELECT cd.hardship_index
	FROM chicago_public_schools cps, census_data cd
	WHERE cps.community_area_number = cd.community_area_number
	AND cps.college_enrollment = 4368
;

--Problem 12:

--Retrieve hardship_index from community with the school that has the highest enrollment

SELECT cps.community_area_number, cps.community_area_name, cps.college_enrollment, cd.hardship_index
	FROM chicago_public_schools cps, census_data cd
	WHERE cps.community_area_number = cd.community_area_number
	AND cps.college_enrollment = (SELECT max(college_enrollment) FROM chicago_public_schools)
;
