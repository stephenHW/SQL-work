--------------------------------------------------------------------
--SELECT Statement--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Query a database
--	Retrieve data records from one or more tables of a database as resultset according to the criteria you specify

-------------------------------------------------------
--Exploring the Database--
-------------------------------------------------------

--Query 1:

--Select the datatable FILM_LOCATIONS_IN_SAN_FRANCISCO

SELECT * FROM film_locations_in_san_francisco
;

-------------------------------------------------------
--Exercises on SELECT Statement--
-------------------------------------------------------

--Query 1:

--Retrieve the TITLE of all films with director names and writer names

SELECT title, director, writer FROM film_locations_in_san_francisco
;

--Query 2:

--Retrieve the TITLE of all films released in the 21st century and onwards, along with filming locations and release year

SELECT title, release_year, locations FROM film_locations_in_san_francisco 
	WHERE release_year >= 2001;

-------------------------------------------------------
--Practice Exercises on SELECT Statement--
-------------------------------------------------------

--Query 1:

--Retrieve FUN_FACTS and LOCATIONS column

SELECT locations, fun_facts FROM film_locations_in_san_francisco
;

--Query 2:

--Retrieve the TITLE of all films released in the 20th century and before, RELEASE_YEAR and LOCATIONS column 

SELECT title, release_year, locations FROM film_locations_in_san_francisco 
	WHERE release_year <= 2000
;
	
--Query 3: 

--Retrieve the TITLE, PRODUCTION_COMPANY, LOCATIONS, and RELEASE_YEAR of all films not written by James Cameron

SELECT title, production_company, locations, release_year FROM film_locations_in_san_francisco 
	WHERE Writer<>"James Cameron"
;
