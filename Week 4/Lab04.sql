-- Part A (DDL) :
-- 1.	Create table the following tables and their given constraints:
-- MOVIES (movieid:int, title:varchar(35), year:int, director:int,score:decimal(3,2))
CREATE TABLE MOVIES 
(
mid int PRIMARY KEY,
title varchar(35) NOT NULL,
releaseYear int NOT NULL,
director int NOT NULL,
score decimal(3,2)
);

-- ACTORS (actorid:int, name:varchar(20), lastname:varchar(30)
CREATE TABLE ACTORS
(
aid int PRIMARY KEY,
firstName varchar(20) NOT NULL,
lastName varchar(30) NOT  NULL
);

-- CASTINGS (movieid:int, actorid:int)
CREATE TABLE CASTINGS
(
movieid int,
actorid int,
PRIMARY KEY (movieid,actorid),
 CONSTRAINT MOVIE_CASTING_FK FOREIGN KEY (movieid) REFERENCES MOVIES(id),
 CONSTRAINT MOVIE_ACTOR_FK FOREIGN KEY (actorid) REFERENCES ACTORS(id)
 );

-- DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))
CREATE TABLE DIRECTORS
(
directorid int PRIMARY KEY,
firstname varchar(20) NOT NULL,
lastname varchar(30) NOT NULL
);

-- 2.	Modify the movies table to create a foreign key constraint that refers to table directors. 
ALTER TABLE MOVIES
	ADD CONSTRAINT MOVIE_DIRECTOR_FK FOREIGN KEY (director) REFERENCES DIRECTORS(id);
                                    
-- 3.	Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed. 
ALTER TABLE MOVIES
	ADD CONSTRAINT TITLE_UNIQUE UNIQUE(title);
    
-- 4.	Write insert statements to add the following data to table directors and movies.
INSERT INTO DIRECTORS 
(directorid, firstname, lastname)
VALUE
 (1010, 'Rob', 'Minkoff'),
 (1020, 'Bill', 'Condon'),
 (1050, 'Josh', 'Cooley'),
 (2010, 'Brad', 'Bird'),
 (3020, 'Lake', 'Bell');
 
 
 INSERT INTO MOVIES
 (id , title, year, director, score)
VALUE 
(100, 'The Lion King', 2019, 3020, 3.50),
 (200, 'Beauty and the Beast', 2017, 1050, 4.20),
 (300, 'Toy Story 4', 2019, 1020, 4.50),
 (400, 'Mission Impossible', 2018, 2010, 5.00),
 (500, 'The Secret Life of Pets', 2016, 1010, 3.90);
 
-- 5.	Write a SQL statement to remove all above tables. Is the order of tables important when removing? Why? 
DROP TABLE  CASTINGS, MOVIES, DIRECTORS, ACTORS ;
/* Yes , the order of tables matters because when we try to delete we should first delete the table which has
foreign key since it have relevant to other table! else, it can create a problem.*/	

-- Part B (More DML):
-- 6.	Create a new empty table employee2 the same as table employees.  Use a single statement to create the table and insert the data at the same time.
CREATE TABLE employee2
(
employeeNumber int PRIMARY KEY,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
officeCode varchar(10) NOT NULL,
reportsTo int(11) DEFAULT null,
jobTitle varchar(50) NOT NULL,
CONSTRAINT EMPLLOYEE_OFFICECODE_FK FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
CONSTRAINT EMPLLOYEE_REPORT_FK FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);


/* 7.	Modify table employee2 and add a new column username to this table. The value of this column is not required and does not have to be unique.
 The value of this column is not required and does not have to be unique.*/
 ALTER TABLE employee2
ADD COLUMN username  varchar(50) ;

--8.	Delete all the data in the employee2 table.

DELETE FROM employee2;


-- 9.	Re-insert all data from the employees table into your new table employee2 using a single statement. 
INSERT INTO employee2 (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
SELECT * 
FROM employees; 


/*10.	In table employee2, write a SQL statement to change the first name and the last name of employee with ID 1002 to your name. */
UPDATE employee2 SET 
firstName = 'Davinder',
lastName = 'Verma'
WHERE employeeNumber = 1002;

/*11.	In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. 
For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters.  */
UPDATE employee2 SET username = lower(CONCAT(lEFT(firstName,1),lastName))
WHERE firstName is NOT NULL 
AND lastName is NOT NULL;

-- 12.	In table employee2, remove all employees with office code 4. 
DELETE FROM employee2
WHERE officeCode = 4;

-- 13. Drop table employee2
	DROP TABLE employee2;