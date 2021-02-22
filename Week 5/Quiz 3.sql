CREATE TABLE STUDENT 
(
Campus_no Char(1) CONSTRAINTS STUDENT_Campus_no PRIMARY KEY,
mn Numeric(3) CONSTRAINTS STUDENT_mn PRIMARY KEY,
Stud_lname Char(15),
Stud_fname Char(15),
Stud_pgm Char(3) CONSTRAINTS PGM_Pgm_id FOREIGN KEY (Pgm_id) REFERENCES PGM(Pgm_id)
	DEFAULT('CPA'),
Locker_no Numeric(3) CONSTRAINTS STUDENT_Locker_no UNIQUE
);

CREATE TABLE PGM 
(
Pgm_id Char(3) CONSTRAINTS PGM_Pgm_id PRIMARY KEY
		CHECK ('CPA','CPD'),
Pgm_name Char(40) CONSTRAINTS PGM_Pgm_name NOT NULL AND UNIQUE,
No_semesters Numeric(1) CONSTRAINTS PGM_No_semesters NOT NULL
	CHECK(> = 0)
	DEFAULT(6)

);