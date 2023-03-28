--------------------------------------------------------------------
--Built-in functions - Aggregate, Scalar, String, Date and Time Functions--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Compose and run sub-queries with multiple tables
--	Check query results and view log files

-------------------------------------------------------
--Exercise 1: Create Pet Rescue Table--
-------------------------------------------------------

-- Drop the PETRESCUE table in case it exists

DROP TABLE petrescue;


-- Create the PETRESCUE table

CREATE TABLE petrescue (
	id INTEGER NOT NULL,
	animal VARCHAR(20),
	quantity INTEGER,
	cost DECIMAL(6,2),
	rescuedate DATE,
	PRIMARY KEY (id))
;
	
	
-- Insert sample data into PETRESCUE table

INSERT INTO petrescue VALUES 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
;

-------------------------------------------------------
--Exercise 2: Aggregate Functions--
-------------------------------------------------------

--Query A1:

--Calculate the total cost of all animal rescues in the PETRESCUE table

SELECT SUM(cost) FROM petrescue
;

--Query A2:

--Display the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST

SELECT SUM(cost) AS sum_of_cost FROM petrescue
;

--Query A3:

--Display the maximum quantity of animals rescued

SELECT MAX(quantity) FROM petrescue
;

--Query A4:

--Dispay the average cost of animals rescued 

SELECT AVG(cost) FROM petrescue
;

--Query A5:

--Display the average cost of rescuing a dog

SELECT AVG(cost/quantity) FROM petrescue
	WHERE LCASE(animal) = 'dog'
;

-------------------------------------------------------
--Exercise 3: Scalar and String Functions--
-------------------------------------------------------

--Query B1:

--Display the rounded cost of each rescue

SELECT ROUND(cost) FROM petrescue 
;

--Query B2:

--Display the length of each animal name

SELECT LENGTH(animal) FROM petrescue
;

--Query B3:

-- Display the animal name in each rescue in uppercase

SELECT UCASE(animal) FROM petrescue
;

--Query B4:

-- Display the animal name in each rescue in uppercase without duplications

SELECT DISTINCT(UCASE(animal)) FROM petrescue
;

--Query B5:

--Display all the columns from PETRESCUE table, where the animal(s) rescued are cats

SELECT * FROM petrescue
	WHERE LCASE(animal) = 'cat'
;

-------------------------------------------------------
--Exercise 4: Date and Time Functions--
-------------------------------------------------------

--Query C1:

--Display the day of the month when cats have been rescued

SELECT DAY(rescuedate) FROM petrescue
	WHERE animal = 'Cat'
;

--Query C2:

--Display the number of rescues in the 5th month

SELECT * FROM petrescue
	WHERE MONTH(rescuedate) = '05'
;

--NOTE: This displays all the information on the table. If we wanted to get just the number of rescues then we would change to SUM(quantity)

--Query C3:

--Display the number of rescues on the 14th day of the month

SELECT * FROM petrescue
	WHERE DAYOFMONTH(rescuedate) = '14'
;

--Query C4:

--Displays the third day from each rescue because all animals rescued whould see the vet within three days from arrival. 

SELECT (rescuedate + 3 DAYS) AS see_vet_by, rescuedate FROM petrescue
;

--Query C5:

--Display the length of time since the animals have been rescued

SELECT (CURRENT DATE - rescuedate) AS days_rescued FROM petrescue
;