CREATE COLLECTION DB201SCDG06;
DROP COLLECTION DB201SCDG06;


--View 1 CREATE TABLE

-------------------------------------------
--CREATE TABLE DB201SCDG06.INVOICE (
--InvoiceId numeric PRIMARY KEY,
--InvoiceDate DATE NOT NULL, 
--TeamId numeric NOT NULL, 
--CustId numeric
--);
----------------------------------------------

CREATE TABLE DB201SCDG06.CUSTOMER(
CustId NUMERIC PRIMARY KEY,
CustNameF CHAR(15) NOT NULL DEFAULT '', 
CustNameL CHAR(15) NOT NULL DEFAULT '',
Address CHAR (50) NOT NULL DEFAULT '',
City CHAR (20) NOT NULL DEFAULT '',
Zip CHAR (10) NOT NULL DEFAULT ''
);

CREATE TABLE DB201SCDG06.EQUIPUSED(
InvoiceNo NUMERIC NOT NULL,
EquipNo NUMERIC NOT NULL
);
CREATE TABLE DB201SCDG06.EQUIP(
EquipNo NUMERIC PRIMARY KEY,
EquipDesc CHAR(50) NOT NULL DEFAULT ''
);

CREATE TABLE DB201SCDG06.SERVICEUSED(
InvoiceNo NUMERIC NOT NULL,
ServiceCode CHAR(5) NOT NULL,
WorkDuration DECIMAL(3,2) CHECK(WorkDuration >= 0.00)
);
CREATE TABLE DB201SCDG06.SERVICE(
ServiceCode CHAR(5)PRIMARY KEY, 
ServiceDesc CHAR(20) NOT NULL DEFAULT '', 
HourlyCharge DECIMAL(4,2) CHECK(HourlyCharge >= 0.00)
);


--VIEW 2 CREATE TABLE

CREATE TABLE DB201SCDG06.TEAM (
TeamID NUMERIC PRIMARY KEY,
TeamDesc CHAR(20) NOT NULL DEFAULT ''
);

CREATE TABLE DB201SCDG06.TEAMEMPSKILL (
TeamID NUMERIC NOT NULL,
EmpId NUMERIC NOT NULL,
SkillsId NUMERIC NOT NULL,
StartDate DATE NOT NULL
);
CREATE TABLE DB201SCDG06.EMPLOYEE (
EmpId NUMERIC PRIMARY KEY,
EmpNameF CHAR(10) NOT NULL DEFAULT '',
EmpNameL CHAR(10) NOT NULL DEFAULT '',
Ohip CHAR (10)NOT NULL DEFAULT '',
HomeNo CHAR (13) NOT NULL DEFAULT,
PositionId NUMERIC NOT NULL
);

CREATE TABLE DB201SCDG06.POSITIONS(
PositionId NUMERIC PRIMARY KEY,
PositionDesc CHAR (20)NOT NULL DEFAULT ''
);

CREATE TABLE DB201SCDG06.SKILL (
SkillsId NUMERIC PRIMARY KEY,
SkillDesc CHAR (20)NOT NULL DEFAULT ''
);


--VIEW 3 CREATE TABLE

CREATE TABLE DB201SCDG06.PROSALE(
InvoiceId NUMERIC NOT NULL, 
ProductId NUMERIC NOT NULL, 
Qty NUMERIC NOT NULL
);
----------------------------------------
--CREATE TABLE DB201SCDG06.PRODUCT(
--ProductId NUMERIC PRIMARY KEY, 
--ProductDesc CHAR(30) NOT NULL DEFAULT '', 
--Charge DECIMAL (4,2) CHECK(Charge >= 0.00),
--ProClassCode CHAR (5) NOT NULL
--);
--
----------------------------------------
CREATE TABLE DB201SCDG06.INVOICE (
InvoiceId numeric PRIMARY KEY,
InvoiceDate DATE NOT NULL, 
TeamId NUMERIC, 
CustId NUMERIC NOT NULL,
SalesAssId NUMERIC 
);

CREATE TABLE DB201SCDG06.ASSISTANT (
SalesAssId NUMERIC PRIMARY KEY,
AssNameF CHAR(10)NOT NULL DEFAULT '',
AssNameL CHAR(10)NOT NULL DEFAULT ''
);


--VIEW 4 CREATE TABLE

CREATE TABLE DB201SCDG06.CLASS (
ProClassCode CHAR(5) PRIMARY KEY,
ClassDesc CHAR(20)NOT NULL DEFAULT '',
Markup CHAR(10)NOT NULL DEFAULT ''
);
------------------------------------
--CREATE TABLE DB201SCDG06.PRODUCT (
--ProductId NUMERIC PRIMARY KEY,
--ProductDesc CHAR(20)NOT NULL DEFAULT '',
--Cost DECIMAL(4,2)CHECK(Cost >= 0.00),
--ProClassCode CHAR(5)NOT NULL
--);




--VIEW 5 CREATE TABLE
--------------------------------------
--CREATE TABLE DB201SCDG06.PRODUCT (
--ProductId NUMERIC PRIMARY KEY,
--ProductDesc CHAR(20)NOT NULL DEFAULT '',
--AisleNo NUMERIC NOT NULL,
--InventoryId NUMERIC NOT NULL
--);
--------------------------------------
CREATE TABLE DB201SCDG06.PRODUCT (
ProductId NUMERIC PRIMARY KEY,
ProductDesc CHAR(50)NOT NULL DEFAULT '',
Cost DECIMAL(4,2)CHECK(Cost >= 0.00),
InventoryId NUMERIC NOT NULL,
ProClassCode CHAR(5)NOT NULL
);

CREATE TABLE DB201SCDG06.INVENTORY (
ProductId NUMERIC NOT NULL,
InventoryId NUMERIC NOT NULL,
AisleNo NUMERIC NOT NULL,
SupplierId NUMERIC NOT NULL
);

CREATE TABLE DB201SCDG06.SUPPLIER (
SupplierId NUMERIC PRIMARY KEY,
SupplierName CHAR(40) NOT NULL DEFAULT ''
);





--VIEW1 INSERT

--INSERT INTO DB201SCDG06.INVOICE VALUES (1355,('2019-07-05'),2,56);
INSERT INTO DB201SCDG06.CUSTOMER VALUES (56,'John','Adams','234 Bloor W','Toronto','M2S 4S3');
INSERT INTO DB201SCDG06.CUSTOMER (CustId) VALUES (7);
INSERT INTO DB201SCDG06.CUSTOMER (CustId) VALUES (34);

INSERT INTO DB201SCDG06.EQUIPUSED VALUES(1355,20); 
INSERT INTO DB201SCDG06.EQUIPUSED VALUES(1355,10); 
INSERT INTO DB201SCDG06.EQUIPUSED VALUES(1355,2); 
INSERT INTO DB201SCDG06.EQUIP VALUES (20,'hp John Deer tractor/ mower');
INSERT INTO DB201SCDG06.EQUIP VALUES (10,'tree pruning shears');
INSERT INTO DB201SCDG06.EQUIP VALUES (2,'hp Johnson grass trimmer');
INSERT INTO DB201SCDG06.SERVICEUSED VALUES (1355,'LC',0.75);
INSERT INTO DB201SCDG06.SERVICEUSED VALUES (1355,'LW',1.15);
INSERT INTO DB201SCDG06.SERVICEUSED VALUES (1355,'LF',0.25);
INSERT INTO DB201SCDG06.SERVICEUSED VALUES (1355,'TG',0.50);
INSERT INTO DB201SCDG06.SERVICE VALUES('LC','Lawn Cutting',25.00);
INSERT INTO DB201SCDG06.SERVICE VALUES('LW','Lawn Weeding',35.00);
INSERT INTO DB201SCDG06.SERVICE VALUES('LF','Lawn Fertilizing',15.00);
INSERT INTO DB201SCDG06.SERVICE VALUES('TG','Lawn Pruning',45.00);



--VIEW2 INSERT

--Insert TEAM
INSERT INTO DB201SCDG06.TEAM VALUES(1,'General Contracting');
INSERT INTO DB201SCDG06.TEAM VALUES(2,'Pruning and Planting');
INSERT INTO DB201SCDG06.TEAM VALUES(3,'General Maintenance');

--Insert TEAMEMPSKILL (TEAM1)
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(1,120,1,'1998-01-01');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(1,120,2,'1998-01-01');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(1,120,3,'1998-01-01');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(1,122,4,'1999-06-30');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(1,122,5,'1999-06-30');

--Insert TEAMEMPSKILL (TEAM2)
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,121,6,'1998-06-30');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,121,4,'1998-06-30');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,121,7,'1998-06-30');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,123,8,'2005-06-05');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,123,1,'2005-06-05');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(2,123,3,'2005-06-05');

--Insert TEAMEMPSKILL (TEAM3)
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(3,124,6,'1998-08-23');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(3,124,5,'1998-08-23');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(3,126,4,'2017-03-03');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(3,126,2,'2017-03-03');
INSERT INTO DB201SCDG06.TEAMEMPSKILL VALUES(3,126,1,'2017-03-03');

--INSERT EMPLOYEE
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(120,'Cindy','Lee','219032002','905-338-1234',1);
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(122,'Amy','Smith','34111991','905-338-1234',2);
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(121,'Paula','Corelli','325443001','416-458-4562',2);
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(123,'Paul','Huang','54222991','416-932-4533',1);
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(124,'Maria','Wong','43524532','905-345-5366',2);
INSERT INTO DB201SCDG06.EMPLOYEE VALUES(126,'Phil','Ramirez','32543555','416-435-6599',1);

--INSERT POSITIONS
INSERT INTO DB201SCDG06.POSITIONS VALUES(1,'Supervisor');
INSERT INTO DB201SCDG06.POSITIONS VALUES(2,'Lawn Care');

--INSERT SKILL
INSERT INTO DB201SCDG06.SKILL VALUES(1,'Electrical');
INSERT INTO DB201SCDG06.SKILL VALUES(2,'Plumbing');
INSERT INTO DB201SCDG06.SKILL VALUES(3,'General Contractor');
INSERT INTO DB201SCDG06.SKILL VALUES(4,'Irrigation');
INSERT INTO DB201SCDG06.SKILL VALUES(5,'Lawn Maintenance');
INSERT INTO DB201SCDG06.SKILL VALUES(6,'Pruning');
INSERT INTO DB201SCDG06.SKILL VALUES(7,'Fertilizing');
INSERT INTO DB201SCDG06.SKILL VALUES(8,'"A"License');

 


--VIEW 3 INSERT

--INSERT PROSALE
INSERT INTO DB201SCDG06.PROSALE VALUES(1356,10,1);
INSERT INTO DB201SCDG06.PROSALE VALUES(1356,40,1);
INSERT INTO DB201SCDG06.PROSALE VALUES(1356,140,3);
INSERT INTO DB201SCDG06.PROSALE VALUES(1367,100,5);
INSERT INTO DB201SCDG06.PROSALE VALUES(1367,110,2);
INSERT INTO DB201SCDG06.PROSALE VALUES(1367,50,1);
INSERT INTO DB201SCDG06.PROSALE VALUES(1367,140,2);
INSERT INTO DB201SCDG06.PROSALE VALUES(1401,170,3);
INSERT INTO DB201SCDG06.PROSALE VALUES(1401,190,3);
INSERT INTO DB201SCDG06.PROSALE VALUES(1405,50,1);

------------------------------------------------------------------------------
--INSERT PRODUCT
--INSERT INTO DB201SCDG06.PRODUCT VALUES(10,'6 foot garden rake',12.00,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(40,'Flat-nosed Shovel',8.00,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(140,'General grade lawn fertilizer',10.00,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(100,'Golden cedar sapling',35.00,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(110,'Mulberry sapling',15.00,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(50,'Garden pitch-fork',7.00,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(140,'General grade lawn fertilizer',10.00,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(170,'120 foot watering hose',25.00,'SP');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(190,'Rotating sprinkler jet',19.00,'SP');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(50,'Garden pitch-fork',7.00,'GT');
-------------------------------------------------------------------------------------------



--INSERT INVOICE
INSERT INTO DB201SCDG06.INVOICE (InvoiceId,InvoiceDate,TeamId,CustId)VALUES (1355,('2019-07-05'),2,56);
--DON'T KNOW SALES ASSISTANT
INSERT INTO DB201SCDG06.INVOICE (InvoiceId,InvoiceDate,CustId,SalesAssId) VALUES (1356,('2018-07-05'),56,144);
INSERT INTO DB201SCDG06.INVOICE (InvoiceId,InvoiceDate,CustId,SalesAssId) VALUES (1367,('2018-07-06'),7,145);
INSERT INTO DB201SCDG06.INVOICE (InvoiceId,InvoiceDate,CustId,SalesAssId) VALUES (1401,('2018-07-06'),34,144);
INSERT INTO DB201SCDG06.INVOICE (InvoiceId,InvoiceDate,CustId,SalesAssId) VALUES (1405,('2018-07-07'),56,145);
--DON'T KNOW WHAT IS THE TEAM NUMBER

--INSERT ASSISTANT
INSERT INTO DB201SCDG06.ASSISTANT VALUES(144,'Paul','Smith');
INSERT INTO DB201SCDG06.ASSISTANT VALUES(145,'Maria','Wong');



--INSERT  VIEW 4

--INSERT CLASS
INSERT INTO DB201SCDG06.CLASS VALUES('GT','Garden Tools','30%');
INSERT INTO DB201SCDG06.CLASS VALUES('SB','Shrubs','50%');
INSERT INTO DB201SCDG06.CLASS VALUES('FT','Fertilizers','25%');
INSERT INTO DB201SCDG06.CLASS VALUES('SP','Sprinklers','40%');

--INSERT PRODUCT
--------------------------------------------------------------------------------------
--INSERT INTO DB201SCDG06.PRODUCT VALUES(10,'6 foot garden rake',9.23,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(20,'7 foot leaf rake',7.69,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(30,'Round mouth shovel',7.69,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(40,'Flat-nosed Shovel',6.15,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(50,'Garden pitch-fork',5.38,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(60,'8 inch hand shears',11.54,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(70,'12 inch trimming shears',14.62,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(80,'10 inch tamper',10.77,'GT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(90,'Cedar sapling',20.00,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(100,'Golden cedar sapling',23.33,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(110,'Mulberry sapling',10.00,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(120,'Juniper sapling',16.67,'SB');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(130,'Premium lawn fertilizer',12.00,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(140,'General grade lawn fertilizer',8.00,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(150,'Premium garden fertilizer',14.40,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(160,'General grade garden fertilizer',9.6,'FT');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(170,'120 foot watering hose',9.6,'SP');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(180,'12 inch aluminum sprinkler',9.6,'SP');
--INSERT INTO DB201SCDG06.PRODUCT VALUES(190,'Rotating sprinkler jet',9.6,'SP');
------------------------------------------------------------------------------------------


--INSERT VIEW 5

--INSERT PRODUCT
INSERT INTO DB201SCDG06.PRODUCT VALUES(10,'6 foot garden rake',9.23, 5,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(20,'7 foot leaf rake',7.69, 5,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(30,'Round mouth shovel',7.69, 4,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(40,'Flat-nosed Shovel',6.15, 2,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(50,'Garden pitch-fork',5.38, 6,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(60,'8 inch hand shears',11.54, 9,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(70,'12 inch trimming shears',14.62, 10,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(80,'10 inch tamper',10.77, 3,'GT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(90,'Cedar sapling',20.00, 34,'SB');
INSERT INTO DB201SCDG06.PRODUCT VALUES(100,'Golden cedar sapling',23.33, 23,'SB');
INSERT INTO DB201SCDG06.PRODUCT VALUES(110,'Mulberry sapling',10.00, 12,'SB');
INSERT INTO DB201SCDG06.PRODUCT VALUES(120,'Juniper sapling',16.67,15,'SB');
INSERT INTO DB201SCDG06.PRODUCT VALUES(130,'Premium lawn fertilizer',12.00, 4,'FT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(140,'General grade lawn fertilizer',8.00, 12,'FT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(150,'Premium garden fertilizer',14.40, 14,'FT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(160,'General grade garden fertilizer',9.6, 12,'FT');
INSERT INTO DB201SCDG06.PRODUCT VALUES(170,'120 foot watering hose',9.6, 9,'SP');
INSERT INTO DB201SCDG06.PRODUCT VALUES(180,'12 inch aluminum sprinkler',9.6, 5,'SP');
INSERT INTO DB201SCDG06.PRODUCT VALUES(190,'Rotating sprinkler jet',9.6, 4,'SP');

--INVENTORY
INSERT INTO DB201SCDG06.INVENTORY VALUES(10,5,1,1);
INSERT INTO DB201SCDG06.INVENTORY VALUES(20,5,1,1);
INSERT INTO DB201SCDG06.INVENTORY VALUES(30,4,1,2);
INSERT INTO DB201SCDG06.INVENTORY VALUES(40,2,1,2);
INSERT INTO DB201SCDG06.INVENTORY VALUES(50,6,1,2);
INSERT INTO DB201SCDG06.INVENTORY VALUES(60,9,2,1);
INSERT INTO DB201SCDG06.INVENTORY VALUES(70,10,2,1);
INSERT INTO DB201SCDG06.INVENTORY VALUES(80,3,2,2);
INSERT INTO DB201SCDG06.INVENTORY VALUES(90,34,5,3);
INSERT INTO DB201SCDG06.INVENTORY VALUES(100,23,5,3);
INSERT INTO DB201SCDG06.INVENTORY VALUES(110,12,4,4);
INSERT INTO DB201SCDG06.INVENTORY VALUES(120,15,4,3);
INSERT INTO DB201SCDG06.INVENTORY VALUES(130,4,6,4);
INSERT INTO DB201SCDG06.INVENTORY VALUES(140,12,6,4);
INSERT INTO DB201SCDG06.INVENTORY VALUES(150,14,6,4);
INSERT INTO DB201SCDG06.INVENTORY VALUES(160,12,6,4);
INSERT INTO DB201SCDG06.INVENTORY VALUES(170,9,3,5);
INSERT INTO DB201SCDG06.INVENTORY VALUES(180,5,3,5);
INSERT INTO DB201SCDG06.INVENTORY VALUES(190,4,3,5);

--SUPPLIER
INSERT INTO DB201SCDG06.SUPPLIER VALUES(1,'Sheffield-Gander inc.');
INSERT INTO DB201SCDG06.SUPPLIER VALUES(2,'Husky Inc.');
INSERT INTO DB201SCDG06.SUPPLIER VALUES(3,'Northwood Farms inc.');
INSERT INTO DB201SCDG06.SUPPLIER VALUES(4,'Sherwood Nursery');
INSERT INTO DB201SCDG06.SUPPLIER VALUES(5,'Diemar Garden Center');




--VIEW 1 FOREIGN KEY

--EQUIPUSED
ALTER TABLE DB201SCDG06.EQUIPUSED
 ADD CONSTRAINT DB201SCDG06.EQUIPUSED_FK1 FOREIGN KEY (InvoiceNo)
 REFERENCES DB201SCDG06.INVOICE(InvoiceId);
 
ALTER TABLE DB201SCDG06.EQUIPUSED
 ADD CONSTRAINT DB201SCDG06.EQUIPUSED_FK2 FOREIGN KEY (EquipNo)
 REFERENCES DB201SCDG06.EQUIP(EquipNo);
 
ALTER TABLE DB201SCDG06.EQUIPUSED
 ADD CONSTRAINT DB201SCDG06.EQUIPUSED_PK PRIMARY KEY (InvoiceNo,EquipNo);
 
--SERVICEUSED
ALTER TABLE DB201SCDG06.SERVICEUSED
  ADD CONSTRAINT DB201SCDG06.SERVICEUSED_FK1 FOREIGN KEY(InvoiceNo)
  REFERENCES DB201SCDG06.INVOICE(InvoiceId);
  
ALTER TABLE DB201SCDG06.SERVICEUSED
  ADD CONSTRAINT DB201SCDG06.SERVICEUSED_FK2 FOREIGN KEY(ServiceCode)
  REFERENCES DB201SCDG06.SERVICE(ServiceCode);
  
ALTER TABLE DB201SCDG06.SERVICEUSED
  ADD CONSTRAINT DB201SCDG06.SERVICEUSED_PK PRIMARY KEY(InvoiceNo,ServiceCode);
 

 
--VIEW 2 FOREIGN KEY

--TEAMEMPSKILL
ALTER TABLE DB201SCDG06.TEAMEMPSKILL
 ADD CONSTRAINT DB201SCDG06.TEAMID_FK FOREIGN KEY (TeamID)
 REFERENCES DB201SCDG06.TEAM(TeamId);
 
ALTER TABLE DB201SCDG06.TEAMEMPSKILL
 ADD CONSTRAINT DB201SCDG06.EMPID_FK FOREIGN KEY (EmpId)
 REFERENCES DB201SCDG06.EMPLOYEE(EmpId);
 
ALTER TABLE DB201SCDG06.TEAMEMPSKILL
 ADD CONSTRAINT DB201SCDG06.SKILLSID_FK FOREIGN KEY (SkillsId)
 REFERENCES DB201SCDG06.SKILL(SkillsId);
 
 ALTER TABLE DB201SCDG06.TEAMEMPSKILL
 ADD CONSTRAINT DB201SCDG06.TEAMEMPSKILL_PK PRIMARY KEY (TeamId,EmpId, SkillsId);
 
--EMPLOYEE
ALTER TABLE DB201SCDG06.EMPLOYEE
 ADD CONSTRAINT DB201SCDG06.EMPPOSITION_FK FOREIGN KEY (PositionId)
 REFERENCES DB201SCDG06.POSITIONS(PositionId);


--VIEW 3 FOREIGN KEY

--PROSALE
ALTER TABLE DB201SCDG06.PROSALE
 ADD CONSTRAINT DB201SCDG06.PROINVOICE_FK FOREIGN KEY (InvoiceId)
 REFERENCES DB201SCDG06.INVOICE(InvoiceId);
 
ALTER TABLE DB201SCDG06.PROSALE
 ADD CONSTRAINT DB201SCDG06.PRODUCT_FK FOREIGN KEY (ProductId)
 REFERENCES DB201SCDG06.PRODUCT(ProductId);
 
ALTER TABLE DB201SCDG06.PROSALE
 ADD CONSTRAINT DB201SCDG06.PROSALE_PK PRIMARY KEY (InvoiceId,ProductId);

--INVOICE
ALTER TABLE DB201SCDG06.INVOICE
  ADD CONSTRAINT DB201SCDG06.TEAMID_FK2 FOREIGN KEY(TeamId)
 REFERENCES DB201SCDG06.TEAM(TeamId);
 
ALTER TABLE DB201SCDG06.INVOICE
  ADD CONSTRAINT DB201SCDG06.INVOCUSTOMER_FK FOREIGN KEY(CustID)
 REFERENCES DB201SCDG06.CUSTOMER(CustID);
 
 ALTER TABLE DB201SCDG06.INVOICE
  ADD CONSTRAINT DB201SCDG06.SALESASSID_FK FOREIGN KEY(SalesAssId)
 REFERENCES DB201SCDG06.ASSISTANT(SalesAssId);
 
 
--VIEW 4 FOREIGN KEY
ALTER TABLE DB201SCDG06.PRODUCT
  ADD CONSTRAINT DB201SCDG06.PROCLASS_FK FOREIGN KEY(ProClassCode)
  REFERENCES DB201SCDG06.CLASS(ProClassCode);


--VIEW 5 FOREUGN KEY
ALTER TABLE DB201SCDG06.INVENTORY
 ADD CONSTRAINT DB201SCDG06.PROINVENTORY_PK PRIMARY KEY (ProductId, InventoryId);
 
ALTER TABLE DB201SCDG06.INVENTORY
  ADD CONSTRAINT DB201SCDG06.INVENSUPPLIER_FK FOREIGN KEY(SupplierId)
  REFERENCES DB201SCDG06.SUPPLIER(SupplierId);




--DISPLAY
SELECT *FROM DB201SCDG06.INVOICE;
SELECT * FROM DB201SCDG06.CUSTOMER;
SELECT *FROM DB201SCDG06.EQUIPUSED;
SELECT * FROM DB201SCDG06.EQUIP;
SELECT *FROM DB201SCDG06.SERVICEUSED;
SELECT * FROM DB201SCDG06.SERVICE;
SELECT *FROM DB201SCDG06.TEAM;
SELECT * FROM DB201SCDG06.TEAMEMPSKILL;
SELECT *FROM DB201SCDG06.EMPLOYEE;
SELECT * FROM DB201SCDG06.POSITIONS;
SELECT *FROM DB201SCDG06.SKILL;
SELECT *FROM DB201SCDG06.PROSALE;
SELECT *FROM DB201SCDG06.PRODUCT;
SELECT *FROM DB201SCDG06.ASSISTANT;
SELECT *FROM DB201SCDG06.CLASS;
SELECT *FROM DB201SCDG06.INVENTORY;
SELECT *FROM DB201SCDG06.SUPPLIER;


-------------------------------------------------------------
--VIEW1
CREATE VIEW DB201SCDG06.VIEW1 AS 
SELECT InvoiceId,InvoiceDate,TeamId, i.CustId,CustNameF,CustNameL,Address,
City,Zip, e.EquipNo, EquipDesc, s.ServiceCode,ServiceDesc,HourlyCharge, WorkDuration
FROM DB201SCDG06.INVOICE i,DB201SCDG06.CUSTOMER c, DB201SCDG06.EQUIP e,DB201SCDG06.EQUIPUSED eu, DB201SCDG06.SERVICE s,DB201SCDG06.SERVICEUSED su
WHERE s.ServiceCode = su.ServiceCode
and i.CustId = c.CustId
and e.EquipNo = eu.EquipNo
and eu.InvoiceNo = su.InvoiceNo
and invoiceid = 1355;

--DROP VIEW DB201SCDG06.VIEW1;

SELECT * FROM DB201SCDG06.VIEW1
ORDER BY InvoiceId;
------------------------------------------------------------------

--VIEW2
CREATE VIEW DB201SCDG06.VIEW2 AS 
SELECT t.TeamId, TeamDesc,e.EmpId,s.SkillsId, StartDate, EmpNameF, EmpNameL, Ohip, HomeNo, p.PositionId,
PositionDesc,SkillDesc
FROM DB201SCDG06.TEAM t, DB201SCDG06.TEAMEMPSKILL tes,DB201SCDG06.EMPLOYEE e,
DB201SCDG06.POSITIONS p ,DB201SCDG06.SKILL s
WHERE t.teamid = tes.teamid
AND e.empid = tes.empid
AND s.skillsid = tes.skillsid
AND p.positionid = e.positionid;

SELECT * FROM DB201SCDG06.VIEW2
ORDER BY teamid;
----------------------------------------------------------------------

--VIEW3
CREATE VIEW DB201SCDG06.VIEW3 AS 
SELECT p.InvoiceId, pro.ProductId,Qty,ProductDesc, pro.ProClassCode,
i.InvoiceDate,i.Custid, a.SalesAssId, a.AssNameF, a.AssNameL
FROM DB201SCDG06.PROSALE p ,DB201SCDG06.PRODUCT pro, DB201SCDG06.INVOICE i,
DB201SCDG06.ASSISTANT a
WHERE p.invoiceid = i.invoiceid
AND p.productid = pro.productid
AND i.salesassid = a.salesassid;

SELECT * FROM DB201SCDG06.VIEW3
ORDER BY productid;
------------------------------------------------------------------

--VIEW 4
CREATE VIEW DB201SCDG06.VIEW4 AS 
SELECT c.ProClassCode, ClassDesc, Markup,
ProductId, ProductDesc, Cost
FROM DB201SCDG06.CLASS c,DB201SCDG06.PRODUCT p
WHERE c.proclasscode = p.proclasscode;

SELECT * FROM DB201SCDG06.VIEW4
ORDER BY productid;

------------------------------------------------------------------------------
--VIEW 5
CREATE VIEW DB201SCDG06.VIEW5 AS 
SELECT p.ProductId,ProductDesc, COST,i.InventoryId,p.ProClassCode,
AisleNo ,s.SupplierId,SupplierName
FROM DB201SCDG06.PRODUCT p,DB201SCDG06.INVENTORY i,DB201SCDG06.SUPPLIER s
WHERE p.productid = i.productid
AND p.inventoryid = i.inventoryid
AND i.supplierid = s.supplierid;

SELECT * FROM DB201SCDG06.VIEW5
ORDER BY productid;

--------------------------------------------------------------------------

--REVOKE ALL ON DB201SCDG06.INVOICE FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.CUSTOMER FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.EQUIPUSED FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.EQUIP FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.SERVICEUSED FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.SERVICE FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.TEAM FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.TEAMEMPSKILL FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.EMPLOYEE FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.POSITIONS FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.SKILL FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.PROSALE FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.PRODUCT FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.ASSISTANT FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.CLASS FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.INVENTORY FROM PUBLIC;
--REVOKE ALL ON DB201SCDG06.SUPPLIER FROM PUBLIC;


--GRANT VIEW DEFINITION ON DB201SCDG06.INVOICE TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.CUSTOMER TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.EQUIPUSED TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.EQUIP TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.SERVICEUSED TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.TEAM TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.TEAMEMPSKILL TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.EMPLOYEE TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.POSITIONS TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.SKILL TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.PROSALE TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.PRODUCT TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.ASSISTANT TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.CLASS TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.INVENTORY TO WS201J40;
--GRANT VIEW DEFINITION ON DB201SCDG06.SUPPLIER TO WS201J40;

GRANT ALL ON DB201SCDG06.INVOICE TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.CUSTOMER TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.EQUIPUSED TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.EQUIP TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.SERVICEUSED TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.SERVICE TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.TEAM TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.TEAMEMPSKILL TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.EMPLOYEE TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.POSITIONS TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.SKILL TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.PROSALE TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.PRODUCT TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.ASSISTANT TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.CLASS TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.INVENTORY TO DS201C34,DS201D20,DS201C28;
GRANT ALL ON DB201SCDG06.SUPPLIER TO DS201C34,DS201D20,DS201C28;

--READ ONLY FOR INSTRUCTOR
GRANT SELECT ON DB201SCDG06.INVOICE TO WS201J40;
GRANT SELECT ON DB201SCDG06.CUSTOMER TO WS201J40;
GRANT SELECT ON DB201SCDG06.EQUIPUSED TO WS201J40;
GRANT SELECT ON DB201SCDG06.EQUIP TO WS201J40;
GRANT SELECT ON DB201SCDG06.SERVICEUSED TO WS201J40;
GRANT SELECT ON DB201SCDG06.SERVICE TO WS201J40;
GRANT SELECT ON DB201SCDG06.TEAM TO WS201J40;
GRANT SELECT ON DB201SCDG06.TEAMEMPSKILL TO WS201J40;
GRANT SELECT ON DB201SCDG06.EMPLOYEE TO WS201J40;
GRANT SELECT ON DB201SCDG06.POSITIONS TO WS201J40;
GRANT SELECT ON DB201SCDG06.SKILL TO WS201J40;
GRANT SELECT ON DB201SCDG06.PROSALE TO WS201J40;
GRANT SELECT ON DB201SCDG06.PRODUCT TO WS201J40;
GRANT SELECT ON DB201SCDG06.ASSISTANT TO WS201J40;
GRANT SELECT ON DB201SCDG06.CLASS TO WS201J40;
GRANT SELECT ON DB201SCDG06.INVENTORY TO WS201J40;
GRANT SELECT ON DB201SCDG06.SUPPLIER TO WS201J40;
