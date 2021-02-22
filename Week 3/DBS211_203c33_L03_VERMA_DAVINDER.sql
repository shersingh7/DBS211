-- =============================================
-- Name: Davinder Verma      
-- Oracle USER ID: dbs211_203c33
-- Student ID: 121802201
-- Date: 29/09/2020
-- Purpose: DBS211C50 – Lab 03
-- =============================================

SET AUTOCOMMIT ON;

-- 1.
    SELECT * FROM offices;
    
--2.
    SELECT  employeeNumber
    FROM employees 
    WHERE officeCode = 1;

--3.
    SELECT customerNumber, customername, contactfirstname, contactlastname, phone
    FROM customers
    WHERE UPPER(city) = 'PARIS' 
    ORDER BY customerNumber; 
    
--4.
    SELECT  customerNumber, 
        customerName, 
        contactLastname || ', ' || contactFirstname AS contact, 
        phone
    FROM customers
    WHERE UPPER(country) = 'CANADA'
    ORDER BY customerNumber;
    
--5.
    SELECT DISTINCT customerNumber 
    FROM payments
    ORDER BY customerNumber;
--6. 
    SELECT customerNumber, checkNumber, amount
    FROM payments 
    WHERE amount NOT BETWEEN 30000 AND 65000 
    ORDER BY amount DESC;

--7.
    SELECT * FROM orders 
    WHERE UPPER(status) = 'CANCELLED';

--8.
    SELECT productCode, productName, buyPrice, msrp, msrp - buyPrice AS markup, round(100 *(msrp - buyPrice) / buyPrice,1) AS percmarkup 
    FROM products;

--9.
    SELECT * FROM products 
    WHERE UPPER(productName) LIKE '%CO%';

--10.
    SELECT * FROM customers 
    WHERE UPPER(contactFirstName) LIKE 'S%E%';

--11.
    INSERT INTO employees 
    VALUES(007, 'Verma', 'Davinder', 'x007', 'dverma22@myseneca.ca', 4,1088, 'Cashier');

--12.
    SELECT * FROM employees 
    WHERE employeeNumber = 007;

--13.
    UPDATE employees 
    SET jobtitle = 'Head Cashier' 
    WHERE employeeNumber = 007;

--14.
    INSERT INTO employees 
    VALUES(1801, 'Trump', 'Donald', 'x4567', 'donald.trump@email.com', 4, 007, 'Cashier');

--15.
    DELETE FROM employees 
    WHERE employeeNumber = 007;
-- did NOT work, referential integrity prevents the deletion.

--16.
    DELETE FROM employees 
    WHERE employeeNumber = 1801;

    DELETE FROM employees 
    WHERE employeeNumber = 007;
-- it worked now

--17. 
    INSERT ALL 
    INTO employees VALUES(007, 'Verma', 'Davinder', 'x007', 'dverma22@myseneca.ca', 4,1088, 'Head Cashier')
    INTO employees VALUES(1801, 'Trump', 'Donald', 'x4567', 'donald.trump@email.com', 4, 1088, 'Cashier')
    SELECT * FROM dual;

--18.
    DELETE FROM employees 
    WHERE employeeNumber = 1801 OR employeenumber = 007;

