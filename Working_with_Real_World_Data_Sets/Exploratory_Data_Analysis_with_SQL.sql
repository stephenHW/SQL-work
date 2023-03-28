--------------------------------------------------------------------
--Exploratory Data Analysis with SQL--
--------------------------------------------------------------------

-------------------------------------------------------
--Project Overview--
-------------------------------------------------------

--Describe and analyze the three following data sets: 
	--Socioeconomic Indicators in Chicago (CENSUS_DATA),
	--Chicago Public School Data (CHICAGO_PUBLIC_SCHOOLS),
	--Chicago Crime Data (CHICAGO_CRIME_DATA) 

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

------------------------------------------
--Chicago Crime Data--
------------------------------------------

--This data reports crime incidents that occured in Chicago dating back to 2001.

--Note: This data does not contain murders where data exists for each victim.

--Note: This dataset is very large (over 1.5 GB), so we will use a small subset of this dataset. 


--Link to dataset: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2

-------------------------------------------------------
--Writing and Executing Queries to Analyze Data--
-------------------------------------------------------

--Problem 1:

--Find the total number of crimes recorded in the CHICAGO_CRIME_DATA

SELECT COUNT(id) FROM chicago_crime_data
;

--Problem 2:

--Retrieve first 10 rows from CHICAGO_CRIME_DATA

SELECT * FROM chicago_crime_data LIMIT 10
;

--Problem 3:

--Retrieve the number of crimes that involved an arrest

SELECT COUNT(id) FROM chicago_crime_data
	WHERE arrest = TRUE
;

--Problem 4:

--Record all unique types of crime reported at gas stations

SELECT UNIQUE(primary_type) FROM chicago_crime_data
	WHERE location_description LIKE UCASE('%GAS STATION%')
;

--Problem 5:

--List all community areas whos names start with "B"

SELECT community_area_name FROM census_data
	WHERE community_area_name LIKE UCASE('B%')
;

--Problem 6:

--Selects all schools in the community areas 10 to 15 that are healthy school certified 

SELECT name_of_school FROM chicago_public_schools
	WHERE community_area_number BETWEEN 10 AND 15
	AND healthy_school_certified = 'Yes'
;

--Problem 7:

--Calculate the average school safety score

SELECT AVG(safety_score) FROM chicago_public_schools
;

--Problem 8:

--List the top 5 community areas by average college enrollment of students

SELECT community_area_name, AVG(college_enrollment) as avg_college_enrollment
	FROM chicago_public_schools
	GROUP BY community_area_name
	ORDER BY avg_college_enrollment DESC
	LIMIT 5
;

--Problem 9:

--Determine which community area has the lowest school safety score

SELECT community_area_name, safety_score FROM chicago_public_schools
	WHERE safety_score IN (SELECT MIN(safety_score) FROM chicago_public_schools)
;

--Problem 10:

--Determine the per capita income of the community area which has a school safety score of 1

SELECT cd.per_capita_income, cd.community_area_name, cps.safety_score
	FROM census_data cd, chicago_public_schools cps
	WHERE cd.community_area_number = cps.community_area_number
	AND cps.safety_score = 1
;
