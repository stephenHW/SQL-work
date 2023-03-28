--------------------------------------------------------------------
--COUNT, DISTINCT, LIMIT--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Retrieve the number of rows that match a query criteria
--	Remove duplicate values from a result set and return the unique values
--	Restrict the number of rows retrieved from a table

-------------------------------------------------------
--Exploring the Database--
-------------------------------------------------------

--Query 1:

--Select the datatable FILM_LOCATIONS_IN_SAN_FRANCISCO

SELECT * FROM film_locations_in_san_francisco
;

-------------------------------------------------------
--COUNT--
-------------------------------------------------------

------------------------------------------
--Exercises on COUNT--
------------------------------------------

--Query 1: 

--Retrieve the number of rows from the FILM_LOCATIONS_IN_SAN_FRANCISCO table

SELECT COUNT(*) FROM film_locations_in_san_francisco
;

--Query 2:

--Retrieve the number of locations of films that are written by James Cameron

SELECT COUNT(locations) FROM film_locations_in_san_francisco 
	WHERE writer = "James Cameron"
;

------------------------------------------
--Practice Exercises on COUNT--
------------------------------------------

--Query 1:

--Retrieve the number of locations of the films which are directed by Woody Allen

SELECT COUNT(locations) FROM film_locations_in_san_francisco 
	WHERE director = "Woody Allen"
;

--Query 2:

--Retrieves the number of films shot at Russian Hill

SELECT COUNT(title) FROM film_locations_in_san_francisco 
	WHERE locations = "Russian Hill"
;

--Query 3:

--Retrieve the number of rows that have a release year older than 1950

SELECT COUNT(*) FROM film_locations_in_san_francisco 
	WHERE release_year < 1950
;

-------------------------------------------------------
--DISTINCT--
-------------------------------------------------------

------------------------------------------
--Exercises on DISTINCT--
------------------------------------------

--Query 1: 

--Retrieve the name of all films

SELECT DISTINCT title FROM film_locations_in_san_francisco
;

--Query 2: 

--Retrieve the number of release years for all Warner Bros. Pictures 

SELECT COUNT(DISTINCT release_year) FROM film_locations_in_san_francisco 
	WHERE production_company = "Warner Bros. Pictures"
;

------------------------------------------
--Practice Exercises on DISTINCT--
------------------------------------------

--Query 1:

--Retrieve the name of all unique films released in 21st century, and RELEASE_YEAR

SELECT DISTINCT title, release_year FROM film_locations_in_san_francisco
	WHERE release_year >= 2001
;

--Query 2:

--Retrieve the names of all directors and their distinct films in City Hall

SELECT DISTINCT title, director FROM film_locations_in_san_francisco 
	WHERE locations = "City Hall";
	
--Query 3:

--Retrieve the number of distributors distinctly who had films acted by Clint Eastwood as 1st 

SELECT COUNT(DISTINCT distributor) FROM film_locations_in_san_francisco 
	WHERE actor_1 = "Clint Eastwood"
;

-------------------------------------------------------
--LIMIT--
-------------------------------------------------------

------------------------------------------
--Exercises on LIMIT--
------------------------------------------

--Query 1:

--Retrieve the first 25 rows from the FILM_LOCATIONS_IN_SAN_FRANCISCO table

SELECT * FROM film_locations_in_san_francisco LIMIT 25
;

--Query 2: 

--Retrieve the frist 15 rows from the FILM_LOCATIONS_IN_SAN_FRANCISCO starting from row 11

SELECT * FROM film_locations_in_san_francisco LIMIT 15 OFFSET 10
;

------------------------------------------
--Practice Exercises on LIMIT--
------------------------------------------

--Query 1: 

--Retrieve the name of first 50 films distinctly

SELECT DISTINCT title FROM film_locations_in_san_francisco LIMIT 50
;

--Query 2:

--Retrieve the first 10 film names distinctly released in 2015

SELECT DISTINCT title FROM film_locations_in_san_francisco 
	WHERE release_year = 2015 LIMIT 10
;

--Query 3:

--Retrieve the next 3 film names distinctly after the first 5 films released 2015

SELECT DISTINCT title FROM film_locations_in_san_francisco 
	WHERE release_year = 2015 LIMIT 3 OFFSET 5
;