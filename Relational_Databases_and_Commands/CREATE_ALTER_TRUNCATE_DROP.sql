--------------------------------------------------------------------
--CREATE, ALTER, TRUNCATE, DROP--
--------------------------------------------------------------------

-------------------------------------------------------
--Objectives--
-------------------------------------------------------

--	Create a new table in a database
--	Add, delete, or modify columns in an existing table
--	Remove all rows from an existing table without deleting the table itself
--	Delete an existing table in a database

-------------------------------------------------------
--Exercise 1: CREATE--
-------------------------------------------------------

--Create two new tables named PETSALE and PET

CREATE TABLE petsale (
	id INTEGER NOT NULL,
	pet CHAR(20),
	saleprice DECIMAL(6,2),
	profit DECIMAL (6,2),
	saledate DATE
	)
;
	
CREATE TABLE pet (
	id INTEGER NOT NULL,
	animal VARCHAR(20),
	quantity INTEGER
	)
;
	
--Insert some records into both tables

INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29',0),
    (2,'Dog',666.66,150.76,'2018-06-01',0),
    (3,'Parrot',50.00,8.9,'2018-06-04',0),
    (4,'Hamster',60.60,12,'2018-06-11',0),
    (5,'Goldfish',48.48,3.5,'2018-06-14',0);
	
INSERT INTO pet VALUES
	(1,'Cat',3),
	(2,'Dog',4),
	(3,'Hamster',2);
	
--Grabing entire tables to check that data was inserted

SELECT * FROM petsale;
SELECT * FROM pet;

-------------------------------------------------------
--Exercise 2: ALTER--
-------------------------------------------------------

------------------------------------------
--TASK A: ALTER using ADD COLUMN--
------------------------------------------

--Add a new column named QUANTITY to PETSALE data table 

ALTER TABLE petsale
ADD COLUMN quantity INTEGER;

--Update QUANTITY column with new values

UPDATE petsale SET quantity = 9 WHERE id = 1;
UPDATE petsale SET quantity = 3 WHERE id = 2;
UPDATE petsale SET quantity = 2 WHERE id = 3;
UPDATE petsale SET quantity = 6 WHERE id = 4;
UPDATE petsale SET quantity = 24 WHERE id = 5;

------------------------------------------
--TASK B: ALTER using DROP COLUMN--
------------------------------------------

--Deletes the PROFIT column from the PETSALE table

ALTER TABLE petsale 
DROP COLUMN profit;

--Check to ensure that PETSALE has been removed

SELECT * FROM petsale;

------------------------------------------
--TASK C: ALTER using ALTER COLUMN--
------------------------------------------

--Change the data type of the PET column to VARCHAR(20) in the PETSALE table

ALTER TABLE petsale
ALTER COLUMN pet SET DATA TYPE VARCHAR(20);

------------------------------------------
--TASK D: ALTER using RENAME COLUMN--
------------------------------------------

--Rename the PET column to ANIMAL in the PETSALE table

ALTER TABLE petsale
RENAME COLUMN pet TO animal;

--Check to see that PET is now replaced with ANIMAL

SELECT * FROM petsale;

-------------------------------------------------------
--Exercise 3: TRUNCATE--
-------------------------------------------------------

--Removes all rows from the PET table

TRUNCATE TABLE pet IMMEDIATE;

--Check to ensure that the PET table is empty

SELECT * FROM pet;

-------------------------------------------------------
--Exercise 4: DROP--
-------------------------------------------------------

--Deletes PET table

DROP TABLE pet;

--Check to see if PET table does not exist anymore

SELECT * FROM pet;