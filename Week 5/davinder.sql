--1.	Create a query that shows employee number, first name, last name, city, phone number and postal code for all employees in France.
----a.	Answer this question using an ANSI-89 Join
----b.	Answer this question using an ANSI-92 Join


----A. 
SELECT e.employeeNumber, e.firstName, e.lastName,o.city, o.phone, o.postalCode
FROM employees e ,offices o 
WHERE e.officeCode = o.officeCode
AND o.country = 'France';

---B.
SELECT e.employeeNumber, e.firstName, e.lastName,o.city, o.phone, o.postalCode
FROM employees e INNER JOIN offices o 
ON e.officeCode = o.officeCode
AND o.country = 'France';



--2.	Create a query that displays all payments made by customers from Canada.  
---a.	Sort the output by Customer Number.  
---b.	Only display the Customer Number, Customer Name, Payment Date and Amount.  
---c.	Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? – Feb 4, 2019, April 2, 2019, April 19, 2002, ….)

---A.
SELECT *
    FROM customers
    WHERE country = 'Canada' 
    ORDER BY customerNumber; 
	
---B.
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
    FROM customers c INNER JOIN payments p
    ON c.country = 'Canada' 
	AND p.customerNumber = c.customerNumber;
	
---C.
SELECT DATE_FORMAT(p.paymentDate, "%b %d, %Y")
    FROM customers c INNER JOIN payments p
    ON c.country = 'Canada' 
	AND p.customerNumber = c.customerNumber;



--3 Create a query that shows all USA customers who have not made a payment.  
---Display only the customer number and customer name sorted by customer number.

SELECT customernumber,customername
FROM customers FULL OUTER JOIN payments 
USING (customernumber)WHERE payments.amount IS NULL AND LOWER (customers.country) LIKE 'usa'
ORDER BY customernumber DESC;


--4.
---a) Create a view (vwCustomerOrder) to list all orders with the following data for all customers:  
---Customer Number, Order number, order date, product name, quantity ordered, and price for each product in every order. 

CREATE OR REPLACE VIEW vwCustomerOrder AS
SELECT C.customername, C.customernumber, O.ordernumber, O.orderdate,
P.productname, OD.quantityordered, OD.priceeach
FROM customers C JOIN orders O ON (C.customernumber = O.customernumber)
JOIN orderdetails OD ON (OD.ordernumber = O.ordernumber)
JOIN products P ON (P.productcode = OD.productcode);

---b) Write a statement to view the results of the view just created.

SELECT * 
FROM vwCustomerOrder;



---5. Using the vwCustomerOrder  view, display the order information for customer number 124. 
---Sort the output based on order number and then order line number. (Yes, I know orderLineNumber is not in the view)

SELECT *FROM vwcustomerorder
WHERE customernumber=124
ORDER BY ordernumber, orderLineNumber;



---6. Create a query that displays the customer number, first name, last name, phone, and credit limits for all customers who do not have any orders.

SELECT C.customernumber, C.customername, C.phone, C.creditlimit
FROM customers C FULL OUTER JOIN orders O
ON (C.customernumber = O.customernumber)
WHERE O.ordernumber IS NULL;


---7. Create a view (vwEmployeeManager) to display all information of all employees and the name and the last name of their managers if there is any manager that the employee reports to.  
---Include all employees, including those who do not report to anyone.

CREATE VIEW vwEmployeeManager AS
SELECT e.*, m.firstName AS managerFirstName, m.lastName AS managerLastName
FROM employees e JOIN employees m ON e.reportsTo = m.employeeNumber;



---8. Modify the employee_manager view so the view returns only employee information for employees who have a manager. 
---Do not DROP and recreate the view – modify it. (Google is your friend).

CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT e.* , m.firstName AS managerFirstName, m.lastName AS managerLastName
FROM employees e LEFT OUTER JOIN employees m ON e.reportsTo = m.employeeNumber;



--9. Drop both customer_order and employee_manager views. 

DROP VIEW vwCustomer_Order, vwEmployeeManager;

