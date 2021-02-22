//==============================================
// Name:           Davinder Verma
// Student Number: 121802201
// Email:          dverma22@myseneca.ca
// Section:        NCC
// LAB:			   6 
// Date:           20/10/2020
//==============================================

----------
Part - A
----------
--1. List the 4 ways that we know that a transaction can be started

--- If the user has started a new connection to the server and has a blank sheet ready to go, starts a new transaction

--- If the user types the BEGIN statement in Oracle SQL, which will start a new transaction

--- If the user runs a COMMIT statement and the current transaction is commited, and a new transaction is started.

--- If the user runs ANY DDL statement. Which automatically triggers an auto-commit of the current transaction and starts a new transaction.



--2. Using SQL, create an empty table, that is the same as the employees table, and name it newEmployees.

CREATE TABLE newEmployees AS
        (SELECT * FROM employees WHERE 1=2);
		
		
		
--3. Execute the following commands.

	SET AUTCOMMIT OFF;
	SET TRANSACTION READ WRITE;
	
	

--4. Write an INSERT statement to populate the newEmployees table with the rows of the sample data. 
--	 Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows)

INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
	


--5. Create a query that shows all the inserted rows from the newEmployees table. How many rows are selected?

	SELECT * FROM newemployees;
---  5 rows are selected



--6. Execute the rollback command. Display all rows and columns from the newEmployees table. 
--	 How many rows are selected?

	COMMIT;
    SELECT * FROM newEmployees;
    ROLLBACK;
    SELECT * FROM newEmployees;
--	5 rows are selected



--7. Repeat Task 4. Make the insertion permanent to the table newEmployees. Display all rows and columns from the newEmployee table. 
--	 How many rows are selected?

	COMMIT;
	SELECT * FROM newEmployees;
	SAVEPOINT A;
--- 5 rows are selected



--8. Write an update statement to update the value of column jobTitle to ‘unknown’ for all the employees in the newEmployees table.

	UPDATE newemployees
	SET jobtitle = 'unknown';
	


--9. Make your changes permanent.

	COMMIT;
	SELECT * FROM newEmployees;
	SAVEPOINT B;



--10. Execute the rollback command. 

---a. Display all employees from the newEmployees table whose job title is ‘unknown’. 
---	  How many rows are still updated?

	COMMIT;
	SELECT * FROM newEmployees WHERE jobtitle = 'unknown';
	ROLLBACK;
	5 results are displayed and still updated

---b. Was the rollback command effective?

---	It was not effective as i previously made the data permanent.

---c. What was the difference between the result of the rollback execution from Task 6 and the result of the rollback execution of this task?

--- There is no difference. It can be if I used an insert statement
--- before the rollback, it would then not show the inserted statement if I would not save it



--11. Begin a new transaction and then create a statement to delete to employees from the newEmployees table

	BEGIN
	DELETE FROM newEmployees;
	COMMIT;
	END;
	


--12. Create a VIEW, called vwNewEmps, that queries all the records in the newEmployees table sorted by last name and then by first name.

	CREATE VIEW vwNewEmps AS
    SELECT * FROM newEmployees
    ORDER BY lastname, firstname;
	
	

--13. Perform a rollback to undo the deletion of the employees

	COMMIT;
	DELETE FROM newEmployees;
	ROLLBACK;

---a. How many employees are now in the newEmployees table?
--- 0 employees.

---b. Was the rollback effective and why?
--- No, the rollback was complete but due the use of commit statement, it was not effective. 
	
	

--14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and run it)

	BEGIN
	INSERT ALL
		INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
		INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
		INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
		INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
		INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
		SELECT * FROM dual;
	COMMIT;
	END;
	


--15. Set a Savepoint, called insertion, after inserting the data

	SELECT * FROM newemployees;
	SAVEPOINT insertion;



--16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and run it again)

	UPDATE newemployees
	SET jobtitle = 'unknown';
	SELECT * FROM newEmployees;



--17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data.
--	  What does the data look like (i.e. describe what happened?


	ROLLBACK TO insertion; 
	
--- It jumps back to step 15, where the jobtitle was Sales Rep.



--18. Use the basic for of the rollback statement and again view the data.  
--	  Describe what the results look like and what happened.

	ROLLBACK;

-- Result is pretty much the same as Q 17. Rollback was execuited untill the last rollback. As there were none, it didnt do anything.



----------
Part - B
----------



--19. Write a statement that denies all access to the newemployees table for all public users

	REVOKE SELECT, UPDATE, INSERT, DELETE ON newemployees FROM public;



--20. Write a statement that allows a classmate (use their database login) read only access to the newemployees table.

	GRANT SELECT ON newEmployees TO dverma22;
	
	

--21. Write a statement that allows the same classmate to modify (insert, update and delete) the data of the newemployees table.

	GRANT INSERT, UPDATE, DELETE ON newEmployees TO dverma22;



--22. Write a statement the denies all access to the newemployees table for the same classmate.

	REVOKE SELECT, INSERT, UPDATE, DELETE ON newEmployees FROM dverma22;



----------
Part - C
----------



--23. Write statements to permanently remove the view and table created for this lab

	DROP VIEW vwNewEmps;
	DROP TABLE newEmployees;

