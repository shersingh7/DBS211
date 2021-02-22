CREATE SCHEMA dverma;
SET SCHEMA dverma;

REVOKE ALL ON SCHEMA dverma FROM PUBLIC;	

CREATE TABLE SUPPLIER (
	supplier_id		integer			PRIMARY KEY,
	supplier_name	varchar(50)			NOT NULL
);

CREATE TABLE CLASS (
	class_id		char(2)			PRIMARY KEY,
	class_name		varchar(50)			NOT NULL
);

CREATE TABLE PRODUCT (
	product_id		integer			PRIMARY KEY,
	product_desc	varchar(200)			NOT NULL,
	product_qty		integer                  NOT NULL,
	product_cost	decimal(6,2)			NOT NULL,	
	product_markup	integer,
	class_id		char(2)			NOT NULL,
	aisle_no		integer,
	supplier_id		integer			NOT NULL,

	CONSTRAINT PRODUCT_CLASS_ID_FK
		FOREIGN kEY (class_id)
		REFERENCES CLASS (class_id),
	CONSTRAINT PRODUCT_SUPPLIER_ID_FK
		FOREIGN KEY (supplier_id)
		REFERENCES SUPPLIER (supplier_id)
);
	
CREATE TABLE SALESREP (
	salesrep_id		integer			PRIMARY KEY,
	salesrep_fname		varchar(30)			NOT NULL,
	salesrep_lname		varchar(30)			NOT NULL
);

CREATE TABLE TEAM (
	team_id		integer			PRIMARY KEY,
	team_desc		varchar(200)			NOT NULL
);

CREATE TABLE EMPLOYEE (
	emp_id		integer			PRIMARY KEY,
	emp_fname		varchar(30)			NOT NULL,
	emp_lname		varchar(30)			NOT NULL,
	emp_phone		char(10)			NOT NULL,
	emp_ohip		char(10)			NOT NULL	
);

CREATE TABLE SKILL (
	skill_id		integer			PRIMARY KEY,
	skill_desc		varchar(200)			NOT NULL
);

CREATE TABLE CUSTOMER (
	cust_id		integer			PRIMARY KEY,
	cust_fname		varchar(30)			NOT NULL,
	cust_lname		varchar(30)			NOT NULL
);

CREATE TABLE ADDRESS (
	address_id		integer			PRIMARY KEY,
	street_no		integer			NOT NULL,
	street_name		varchar(50)			NOT NULL,
	postal_code		varchar(7)			NOT NULL,
	city		varchar(30)			NOT NULL
);

CREATE TABLE SERVICE (
	service_id		char(2)			PRIMARY KEY,
	service_desc		varchar(200)			NOT NULL
);

CREATE TABLE EQUIPMENT (
	equip_id		integer	 		PRIMARY KEY,
	equip_desc		varchar(200) 			NOT NULL
);

CREATE TABLE INVOICE (
	invoice_id		integer	 		PRIMARY KEY,
	invoice_date		date 			NOT NULL,
	total_charge		decimal(7,2),
	team_id		integer,
	cust_id		integer	 		NOT NULL,
	address_id		integer,
	salesrep_id		integer,
	CONSTRAINT INVOICE_TEAM_ID_FK
		FOREIGN KEY (team_id)
		REFERENCES TEAM(team_id),
	
	CONSTRAINT INVOICE_CUST_ID_FK
		FOREIGN KEY(cust_id)
		REFERENCES CUSTOMER (cust_id),

	CONSTRAINT INVOICE_ADDRESS_ID_FK
		FOREIGN KEY (address_id)
		REFERENCES ADDRESS(address_id),

	CONSTRAINT INVOICE_SALESREP_ID_FK
		FOREIGN KEY (salesrep_id)
		REFERENCES SALESREP (salesrep_id)
);

-- JUNCTION TABLES
CREATE TABLE INVOICEPRODUCT (
	invoice_id		integer    NOT NULL,
	product_id		integer    NOT NULL,
	sale_qty		integer			NOT NULL,
	sale_charge		decimal(6,2)			NOT NULL,

	CONSTRAINT PK_INVOICEPRODUCT PRIMARY KEY (invoice_id, product_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE TEAMEMPLOYEE (
	team_id		integer			NOT NULL,
	emp_id		INTEGER			NOT NULL,
	position		varchar(20)			NOT NULL,
	start_date		date			NOT NULL,

	CONSTRAINT PK_TEAMEMPLOYEE PRIMARY KEY (team_id, emp_id),
	FOREIGN KEY (team_id) REFERENCES team(team_id),
	FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE CUSTOMERADDRESS (
	cust_id		integer			NOT NULL,
	address_id		INTEGER			NOT NULL,

	CONSTRAINT PK_CUSTOMERADDRESS PRIMARY KEY (cust_id, address_id),
	FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE INVOICESERVICE (
	invoice_id		integer 		NOT NULL,
	service_id		char(2)		NOT NULL,
	hourly_charge		decimal(6,2)		NOT NULL,
	duration		decimal(5,2)		NOT NULL,

	CONSTRAINT PK_INVOICESERVICE PRIMARY KEY (invoice_id, service_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE EMPLOYEESKILL (
	emp_id		integer		NOT NULL,
	skill_id		integer		NOT NULL,

	CONSTRAINT PK_EMPLOYEESKILL PRIMARY KEY (emp_id, skill_id),
	FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
	FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
);

CREATE TABLE INVOICEEQUIPMENT (
	invoice_id		integer		NOT NULL,
	equip_id		integer 		NOT NULL,

	CONSTRAINT PK_INVOICEEQUIPMENT PRIMARY KEY (invoice_id, equip_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY (equip_id) REFERENCES equipment(equip_id)
);


--INSERT STATEMENTS

INSERT INTO SUPPLIER
    VALUES (1, 'Sheffield-Gander inc.'),
            (2,'Husky Inc.'),
            (3, 'Northwood Farms inc'),
            (4, 'Sherwood Nursery'),
            (5, 'Diemar Garden Center');
            
INSERT INTO CLASS
    VALUES ('GT', 'Garden Tools'),
            ('SB', 'Shrubs'),
            ('FT','Fertilizers'),
            ('SP', 'Sprinklers');

INSERT INTO PRODUCT
    VALUES (10, '6 foot garden rake', 5, 9.23, 30, 'GT', 1, 1),
            (40, 'Flat-nosed Shovel',2, 6.15, 30, 'GT', 1, 2),
            (20, '7 foot leaf rake',5, 7.69, 30, 'GT', 1, 1),
            (30, 'Round mouth shovel',4, 7.69, 30, 'GT', 1, 2),
            (50, 'Garden pitch-fork', 6, 5.38, 30, 'GT', 1, 2),
            (60, '8 inch hand shears', 9, 11.54, 30, 'GT', 2, 1),
            (70, '12 inch trimming shears', 10, 11.54, 30, 'GT', 2, 1),
            (80, '10 inch tamper', 3, 10.77, 30, 'GT', 2, 2),
            (90, 'Cedar sapling', 34, 20.00, 50, 'SB', 5, 3),
            (100, 'Golden cedar sapling', 23, 23.33, 50, 'SB', 5, 3),
            (110, 'Mulberry sapling', 12, 10.00, 50, 'SB', 4, 4),
            (120, 'Juniper sapling', 15, 16.67, 50, 'SB', 4, 3),
            (130, 'Premium lawn fertilizer', 4, 12.00, 25, 'FT', 6, 4),
            (140, 'General grade lawn fertilizer', 12, 8.00, 25, 'FT', 6, 4),
            (150, 'Premium garden fertilizer', 14, 14.40, 25, 'FT', 6, 4),
            (160, 'General grade garden fertilizer', 12, 9.60, 25, 'FT', 6, 4),
            (170, '120 foot watering hose', 9, 17.86, 40, 'SP', 3, 5),
            (180, '12 inch aluminum sprinkler', 5, 10.71, 40, 'SP', 3, 5),
            (190, 'Rotating sprinkler jet', 4, 13.57, 40, 'SP', 3, 5);    

INSERT INTO SALESREP
    VALUES (155, 'Gordon', 'Brown'),
            (158, 'Susan', 'Gill');      
            
INSERT INTO TEAM
    VALUES (1, 'General Contracting'),
            (2, 'Pruning and Planting'),
            (3, 'General Maintenance');
            
INSERT INTO EMPLOYEE
    VALUES (120, 'Wendy', 'Ames', '9053381234', '219032002'),
            (122, 'Terry','Wilson', '9053381234', '34111991'),
            (121, 'Mary', 'Wells', '4164584562', '325443001'),
            (123, 'Peter', 'Wong', '4169324533', '54222991'),
            (124, 'Carrie', 'Fisher', '9053455366', '43524532'),
            (126, 'Brad', 'Phillips', '4164356599', '32543555'); 
            
INSERT INTO SKILL
    VALUES (1, 'Electrical'),
            (2, 'Plumbing'),
            (3, 'General Contractor'),
            (4, 'Irrigation'),
            (5, 'Lawn Maintenance'),
            (6, 'Pruning'),
            (7, 'Fertilizing'),
            (8, '"A" Licence'); 
            
INSERT INTO CUSTOMER
    VALUES (56, 'John', 'Adams'),
            (34, 'Ashley', 'Riley')
           (7, 'Clint', 'MacDonald');          
            
INSERT INTO ADDRESS
   VALUES (1, 234, 'King St.', 'M2S 4S3', 'Oakville'),
         (2, 156, 'Avindale Cresc', 'M4T 4R7', 'Oakville');
        (3, 123, 'Narnia Rd', 'K8J 0J6', 'Oshawa');
            
INSERT INTO SERVICE
    VALUES ('LC', 'Lawn Cutting'),
           ('LW', 'Lawn Weeding'),
            ('LF', 'Lawn Fertilizing'),
            ('TG', 'Tree Pruning'),
             ('GW', 'Garden Weeding'),
             ('GP', 'Garden Planting'),
             ('GF', 'Garden Fertilizing');
        
INSERT INTO EQUIPMENT
    VALUES (1, '20 hp John Deer tractor/mower'),
            (2, '10" tree pruning sheers'),
            (3, '2 hp Johnson grass trimmer'),
            (4, 'Haggmann garden-tiller');  
            
INSERT INTO INVOICE
    VALUES (1356, '2002-07-05', NULL, NULL, 56, 1, 155),
            (1401, '2002-07-06', NULL, NULL, 34, 2, 158),
            (1367, '2002-07-06', NULL, NULL, 7, 3, 158),
            (1405, '2002-07-07', NULL, NULL, 56, 1, 158),
            (1355, '2017-06-05', 98.04, 2, 56, 1, NULL),
            (1412, '2017-06-19', 69.00, 3, 34, 2, NULL);

INSERT INTO INVOICEPRODUCT
    VALUES (1356, 10, 1, 12),
            (1356, 40, 1, 8),
            (1356, 140, 3, 10),
            (1367, 100, 5, 35),
            (1367, 110, 2, 15),
            (1367, 50, 1, 7),
            (1367, 140, 2, 10),
            (1401, 170, 3, 25),
            (1401, 190, 3, 19),
            (1405, 50, 1, 7);
           
INSERT INTO TEAMEMPLOYEE
    VALUES (1, 120, 'Supervisor', '1998-01-01'),
            (1, 122, 'Lawn Care', '1999-06-30'),
            (2, 121, 'Lawn Care', '1998-06-30'),
            (2, 123, 'Supervisor', '2000-06-30'),
            (3, 124, 'Lawn Care', '1998-08-23'),
            (3, 126, 'Supervisor', '2001-03-03');

INSERT INTO CUSTOMERADDRESS
    VALUES (56, 1),
            (34, 2),
            (7, 3);

INSERT INTO INVOICESERVICE
    VALUES (1355, 'LC', 25.00, 0.75),
            (1355, 'LW', 35.00, 1.15),
            (1355, 'LF', 15.00, 0.25),
            (1355, 'TG', 45.00, 0.50),	
            (1412, 'LC', 25.00, 0.75),
            (1412, 'GW', 25.00, 1.15),
            (1412, 'GP', 30.00, 0.25),
            (1412, 'GF', 10.00, 0.50);

INSERT INTO EMPLOYEESKILL
	VALUES (120, 1),
			(120, 2),
			(120, 3),
			(122, 4),
			(122, 5),
			(121, 6),
			(121, 4),
			(121, 7),
			(123, 8),
			(123, 1),
			(123, 3),
			(124, 6),
			(124, 5),
			(126, 4),
			(126, 2),
			(126, 1);

INSERT INTO INVOICEEQUIPMENT
	VALUES (1355, 1),
			(1355, 2),
			(1355, 3),
			(1412, 1),
			(1412, 3),
			(1412, 4);
-- VIEWS

CREATE VIEW USERVIEW1 AS
SELECT invoice.invoice_id AS "INVOICE #",
        invoice_date AS "INVOICE DATE",
        team_id AS "WORK TEAM",
        equip_desc AS "EQUIP USED",
        invoice.cust_id || '-' || cust_fname || ' '|| cust_lname AS "CUSTOMER",
        street_no || ' '|| street_name ||' '|| city ||' '|| postal_code AS "ADDRESS",
        service.service_id AS "SERVICE CODE",
        service_desc AS "DESCRIPTION",
        hourly_charge AS "HOURLY CHARGE",
        duration AS "WORK DURATION (HOURS)",
        hourly_charge * duration AS "TOTAL CHARGE",
        total_charge AS "TOTAL DUE"
    FROM INVOICESERVICE, INVOICE, INVOICEEQUIPMENT, EQUIPMENT, CUSTOMERADDRESS, CUSTOMER, ADDRESS, SERVICE
    WHERE INVOICE.invoice_id = INVOICESERVICE.invoice_id
        AND INVOICE.invoice_id = INVOICEEQUIPMENT.invoice_id
        AND INVOICE.cust_id = CUSTOMER.cust_id
        AND CUSTOMERADDRESS.cust_id = CUSTOMER.cust_id
        AND SERVICE.service_id = INVOICESERVICE.service_id
        AND EQUIPMENT.equip_id = INVOICEEQUIPMENT.equip_id;      
        
CREATE VIEW USERVIEW2 AS
SELECT teamemployee.team_id AS "TEAM",
        team.team_desc AS "DESCRIPTION",
        employee.emp_fname || ' '||emp_lname AS "NAME",
        teamemployee.position AS "POSITION",
        teamemployee.emp_id AS "EMP ID",
        employee.emp_ohip AS "OHIP",
        employee.emp_phone AS "HOME PHONE",
        teamemployee.start_date AS "START DATE",
        skill.skill_desc AS "SKILLS"
    FROM TEAMEMPLOYEE, TEAM, EMPLOYEE, SKILL, EMPLOYEESKILL
    WHERE TEAM.team_id = TEAMEMPLOYEE.team_id
        AND EMPLOYEE.emp_id = TEAMEMPLOYEE.emp_id
        AND TEAMEMPLOYEE.emp_id =EMPLOYEESKILL.emp_id
        AND EMPLOYEESKILL.skill_id = SKILL.skill_id;
		
CREATE VIEW USERVIEW3 AS
SELECT class.class_id AS "PROD. CLASS",
		product.product_id AS "PROD ID",
		product_desc AS "PRODUCT",
		'$' || product_cost AS "CHARGE",
		sale_qty AS "QTY",
		invoiceproduct.invoice_id "INVOICE ID",
		invoice_date AS "INVOICE DATE",
		salesrep.salesrep_id || '-' || salesrep_fname || ' ' || salesrep_lname AS "SALES ASSISTANT",
		invoice.cust_id AS "CUST NO."
	FROM CLASS, PRODUCT, INVOICEPRODUCT, INVOICE, SALESREP, CUSTOMER
	WHERE CLASS.class_id = PRODUCT.class_id
	AND PRODUCT.product_id = INVOICEPRODUCT.product_id
	AND INVOICEPRODUCT.invoice_id = INVOICE.invoice_id
	AND INVOICE.salesrep_id = SALESREP.salesrep_id
	AND INVOICE.cust_id = CUSTOMER.cust_id;

CREATE VIEW USERVIEW4 AS 
SELECT class.class_id AS "PRODUCT CLASS",
		class_name AS "CLASSIFICATION",
		product_id AS "PRODUCT ID",
		product_desc AS "DESCRIPTION",
		'$' || product_cost AS "COST",
		product_markup || '%' AS "MARKUP",
		ROUND((product_cost*(1.0+(product_markup/100.0))),2) AS "CHARGE"
	FROM CLASS, PRODUCT
	WHERE CLASS.class_id = PRODUCT.class_id;

CREATE VIEW USERVIEW5 AS
SELECT product_id AS "PRODUCT ID",
		product_desc AS "DESCRIPTION",
		product_qty AS "INVENTORY",
		aisle_no AS "AISLE #",
		supplier_name AS "SUPPLIER"
	FROM PRODUCT, SUPPLIER
	WHERE PRODUCT.supplier_id = SUPPLIER.supplier_id;