#EXERCISE 1
CREATE database Excercise_Hands_on;
SHOW databases;
USE excercise_hands_on;
CREATE TABLE Trainer_info (Trainer_Id CHAR(20) UNIQUE,
Salutation VARCHAR(7) , 
Trainer_Name VARCHAR(30), 
Trainer_Location VARCHAR(30),
Trainer_Track VARCHAR(15),
Trainer_Qualification VARCHAR(100),
Trainer_Experiance INT(11),
Trainer_Email VARCHAR(100) NOT NULL,
Trainer_Passwor VARCHAR(20) NOT NULL);
CREATE TABLE Batch_Info (Batch_Id VARCHAR(20) PRIMARY KEY,
Batch_Owner VARCHAR(30),
Batch_BU_Name VARCHAR (30));
CREATE TABLE Module_Info (Module_Id VARCHAR(20) PRIMARY KEY,
Module_Name VARCHAR(40),
Module_Duration INTEGER(11));
CREATE TABLE Associate_Info (Associate_Id VARCHAR(20) PRIMARY KEY,
Salutation VARCHAR(7),
Associate_Name VARCHAR(30),
Associate_Location VARCHAR(30),
Associate_Track VARCHAR(15),
Associate_Qualification VARCHAR(200),
Associate_Email VARCHAR(100),
Associate_Password VARCHAR(20));
CREATE TABLE Questions (Question_Id VARCHAR(20) PRIMARY KEY,
Module_Id VARCHAR(20) REFERENCES Module_Info (Module_Id),
Question_Text VARCHAR(900));
CREATE TABLE Associate_Status (
Associate_Id VARCHAR(20) REFERENCES Associate_Info (Associate_Id),
Module_Id VARCHAR(20) REFERENCES Module_Info (Module_Id),
Start_Date VARCHAR(20),
End_Date VARCHAR(20),
AFeedbackGiven VARCHAR(20),
TFeedbackGiven VARCHAR(20));
CREATE TABLE Trainer_Feedback (Trainer_Id CHAR(20) REFERENCES Trainer_info (Trainer_Id),
Question_Id VARCHAR(20) REFERENCES Questions (Question_Id),
Batch_Id VARCHAR(20) REFERENCES Batch_Info (Batch_Id),
Module_Id VARCHAR(20) REFERENCES Module_Info (Module_Id),
Trainer_Rating INTEGER(11));
CREATE TABLE Associate_Feedback (
Associate_Id VARCHAR(20) REFERENCES Associate_Info (Associate_Id),
Question_Id VARCHAR(20) REFERENCES Questions (Question_Id),
Module_Id VARCHAR(20) REFERENCES Module_Info (Module_Id),
Associate_Rating INTEGER(11));
CREATE TABLE Login_Details (
User_Id  VARCHAR(20) PRIMARY KEY,
User_Password VARCHAR(20));

# EXERCISE 2
INSERT INTO Trainer_Info VALUES 
('F001','Mr.', 'PANKAJ GHOSH', 'Pune', 'Java','Bachelor of Technology', 12, 'Pankaj.Ghosh@alliance.com', 'fac1@123'),
('F002','Mr.','SANJAY RADHAKRISHNAN' ,'Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123'),
('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123'),
('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123'),
('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123'),
('F006','Mr.','MANOJ AGRAWAL' ,'Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',5,'Meena.Kulkarni@alliance.com','fac7@123'),
('F009','Mr.','SAGAR MENON ','Mumbai','Java','Master of Science In Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');
SELECT * FROM Trainer_Info;
INSERT INTO Batch_Info VALUES
('B001','MRS.SWATI ROY','MSP'),
('B002','MRS.ARURNA K','HEALTHCARE'),
('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES'),
('B004','MR.SACHIN SHETTY','BFS'),
('B005','MR.RAMESH PATEL','COMMUNICATIONS'),
('B006','MRS.SUSAN CHERIAN','RETAIL & HOSPITALITY'),
('B007','MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');
INSERT INTO Module_Info VALUES
( 'O10SQL','Oracle 10g SQL' ,16),
('O10PLSQl','Oracle 10g PL/ SQL' ,16),
('J2SE','Core Java SE 1.6',288),
('J2EE','Advanced Java EE 1.6',80),
('JAVAFX','JavaFX 2.1',80),
('DOTNT4','.Net Framework 4.0' ,50),
('SQL2008','MS SQl Server 2008',120),
('MSBI08','MS BI Studio 2008',158),
('SHRPNT','MS Share Point' ,80),
('ANDRD4','Android 4.0',200),
('EM001','Instructor',0),
('EM002','Course Material',0),
('EM003','Learning Effectiveness',0),
('EM004','Environment',0),
('EM005','Job Impact',0),
('TM001','Attendees',0),
('TM002','Course Material',0),
('TM003','Environment',0);
SELECT * FROM MODULE_INFO;
INSERT INTO Associate_Info VALUES
('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of Technology','Gayathri.Narayanan@hp.com','tne1@123'),
('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com','tne2@123'),
('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com','tne3@123'),
('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer Applications','Anand.Ranganathan@finolex.com','tne4@123'),
('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering In Information Technology','Leela.Menon@microsoft.com','tne5@123'),
('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com','tne6@123'),
('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of Technology','Prabhakar.Shunmugham@honda.com','tne7@123');
SELECT * FROM Associate_Info;
INSERT INTO Questions VALUES
('Q001','EM001','Instructor knowledgeable and able to handle all your queries'),
('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or slippages'),
('Q003','EM002','The course materials presentation, handson,  etc. refered during the training are relevant and useful.'),
('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.'),
('Q005','EM002','The reference materials suggested for each module are adequate.'),
('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work'),
('Q007','EM003','This training increases my proficiency level'),
('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the training.'),
('Q010','EM005','This training will improve your job performance.'),
('Q011','EM005','This training align with the business priorities and goals.'),
('Q012','TM001','Participants were receptive and had attitude towards learning.'),
('Q013','TM001','All participats gained the knowledge and the practical skills after this training.'),
('Q014','TM002','The course materials presentation, handson,  etc. available for the session covers the entire objectives of the course.'),
('Q015','TM002','Complexity of the course is adequate for the particpate level.'),
('Q016','TM002','Case study and practical demos helpful in understanding of the topic'),
('Q017','TM003','The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q018','TM003','The software/hardware environment provided was adequate  for the purpose of the training.');
SELECT * FROM Questions;
ALTER TABLE Associate_Status ADD COLUMN Batch_Id VARCHAR(20) REFERENCES Batch_Info (Batch_Id);
ALTER TABLE Associate_Status ADD COLUMN Trainer_Id CHAR(20) REFERENCES Trainer_info (Trainer_Id);
SELECT *  FROM Associate_Status;
INSERT INTO Associate_Status VALUES
('A002','O10PLSQL','2001-2-1','2001-2-12','NA', 'NA','B002','F002'),
('A003','O10PLSQL','2001-2-1','2001-2-12','NA', 'NA','B002','F002'),
('A001','J2SE','2002-8-20','2002-10-25','NA', 'NA','B003','F003'),
('A002','J2SE','2002-8-20','2002-10-25','NA', 'NA','B003','F003'),
('A001','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A002','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A003','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A004','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A005','JAVAFX','2005-12-4','2005-12-20','NA', 'NA','B005','F006'),
('A006','JAVAFX','2005-12-4','2005-12-20','NA', 'NA','B005','F006'),
('A006','SQL2008','2007-6-21','2007-6-28','NA', 'NA','B006','F007'),
('A007','SQL2008','2007-6-21','2007-6-28','NA', 'NA','B006','F007'),
('A002','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A003','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A004','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A002','ANDRD4','2010-6-5','2010-6-28','NA', 'NA','B008','F005'),
('A005','ANDRD4','2010-6-5','2010-6-28','NA', 'NA','B008','F005'),
('A003','ANDRD4','2011-8-1','2011-8-20','NA', 'NA','B009','F005'),
('A006','ANDRD4','2011-8-1','2011-8-20','NA', 'NA','B009','F005');
SELECT * FROM Associate_Status;
INSERT INTO Associate_Status VALUES
('A002','O10PLSQL','2001-2-1','2001-2-12','NA', 'NA','B002','F002'),
('A003','O10PLSQL','2001-2-1','2001-2-12','NA', 'NA','B002','F002'),
('A001','J2SE','2002-8-20','2002-10-25','NA', 'NA','B003','F003'),
('A002','J2SE','2002-8-20','2002-10-25','NA', 'NA','B003','F003'),
('A001','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A002','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A003','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A004','J2EE','2005-12-1','2005-12-25','NA', 'NA','B004','F004'),
('A005','JAVAFX','2005-12-4','2005-12-20','NA', 'NA','B005','F006'),
('A006','JAVAFX','2005-12-4','2005-12-20','NA', 'NA','B005','F006'),
('A006','SQL2008','2007-6-21','2007-6-28','NA', 'NA','B006','F007'),
('A007','SQL2008','2007-6-21','2007-6-28','NA', 'NA','B006','F007'),
('A002','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A003','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A004','MSBI08','2009-6-26','2009-6-29','NA', 'NA','B007','F006'),
('A002','ANDRD4','2010-6-5','2010-6-28','NA', 'NA','B008','F005'),
('A005','ANDRD4','2010-6-5','2010-6-28','NA', 'NA','B008','F005'),
('A003','ANDRD4','2011-8-1','2011-8-20','NA', 'NA','B009','F005'),
('A006','ANDRD4','2011-8-1','2011-8-20','NA', 'NA','B009','F005');
SELECT * FROM Associate_Status;

#EXERCISE 3
SELECT * FROM Trainer_Info;
UPDATE Trainer_Info SET Trainer_Passwor='nn4@123' WHERE Trainer_Id='F004';
SELECT * FROM Trainer_Info;

#EXERCISE 4
SELECT * FROM Associate_Status;
DELETE FROM Associate_Status WHERE Associate_Id='A003'AND Module_Id='J2EE' AND Batch_Id='B004' AND Trainer_Id='F004' AND Start_Date='2005-12-1' AND End_Date='2005-12-25';
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Associate_Status WHERE Associate_Id='A003'AND Module_Id='J2EE' AND Batch_Id='B004' AND Trainer_Id='F004' AND Start_Date='2005-12-1' AND End_Date='2005-12-25';
SELECT * FROM Associate_Status;

#EXERCISE 5
SELECT * FROM Trainer_Info ORDER BY Trainer_Experiance DESC LIMIT 5;

#EXCERCISE 6
SELECT * FROM Login_Details;
START transaction;
INSERT INTO Login_Details VALUES  ( 'U001' ,'Admin1@123'),  ('U002', 'Admin2@123'); #Two rows inserted
ROLLBACK;
SELECT * FROM Login_Details; 

#Exercise 7
CREATE USER 'Ayantika@gmail.com' IDENTIFIED BY 'Password';
GRANT CREATE ON excercise_hands_on TO 'Ayantika@gmail.com';
GRANT SELECT ON excercise_hands_on.Login_Details TO 'Ayantika@gmail.com';
SELECT * FROM Login_Details;
START transaction;
INSERT INTO Login_Details VALUES  ( 'U001' ,'Admin1@123'),  ('U002', 'Admin2@123'); #Two rows inserted
ROLLBACK;
REVOKE CREATE ON excercise_hands_on FROM 'Ayantika@gmail.com';
REVOKE SELECT ON excercise_hands_on.Login_Details FROM 'Ayantika@gmail.com';

#EXERCISE 8
DROP TABLE Login_Details;
SELECT  * FROM Login_Details; 

#EXERCISE 9
CREATE TABLE suppliers (supplier_id INT(10) NOT NULL,
supplier_name VARCHAR(50) NOT NULL,
address VARCHAR(50),
city VARCHAR(50),
state VARCHAR(25),
zip_code VARCHAR(10));

#EXERCISE 10
CREATE TABLE Course_Fees (Course_Code varchar(25) PRIMARY KEY, 
Base_fees INT(11),
Special_fees varchar(11),
Discount INT(11));
INSERT INTO Course_Fees VALUES ('1', 180 , '100' ,10), 
('2', 150, '110', 10),
('3', 160, '170', 5),
('4', 150,	'100', 10),
('6', 190,	'100',	40);
CREATE TABLE Course_Fees_History (Course_Code varchar(25) PRIMARY KEY, 
Base_fees INT(11),
Special_fees varchar(11),
CREATED_BY VARCHAR(25),
Updated_By VARCHAR(25));
INSERT INTO Course_Fees_History VALUES ('1', 120, '123', 'Ram', 'Ramesh'),
('2',	150,	'110', 	'Bala'	, 'Ram'),
('3',	160,	'170', 	'Bala'	, 'Vinu'),
('4',	170,	'100', 	'Ram'	, 'Ram'),
('6',	190,	'235', 	'Vinod'	, 'Vinod');
SELECT * FROM Course_Fees;
SELECT * FROM Course_Fees_History;
SELECT Course_Code, Base_fees, Special_fees FROM Course_Fees UNION 
SELECT Course_Code, Base_fees, Special_fees FROM Course_Fees_History;

#EXERCISE 11
#For Table course_fees
SELECT COUNT(*) FROM course_fees;
SELECT COUNT(DISTINCT(course_code)) FROM course_fees;
#Since both count is equal course code is unique in table course_fees
SELECT COUNT(DISTINCT(base_fees)) FROM course_fees;
#Since both count is not equal base fees is not unique in table course_fees 
SELECT COUNT(DISTINCT(special_fees)) FROM course_fees;
#Since both count is not equal special fees is not unique in table course_fees

#For Table course_fees_history
SELECT COUNT(*) FROM course_fees_history;
SELECT COUNT(DISTINCT(course_code)) FROM course_fees_history;
#Since both count is equal course code is unique in table course_fees_history
SELECT COUNT(DISTINCT(base_fees)) FROM course_fees_history;
#Since both count is equal base fees is unique in table course_fees_history.
SELECT COUNT(DISTINCT(special_fees)) FROM course_fees_history;
#Since both count is equal special fees is unique in table course_history.

#EXERCISE 12
#Pre-requisite 
CREATE TABLE course_info( 
COURSE_CODE varchar(10) PRIMARY KEY, 
COURSE_NAME varchar(20) NOT NULL, 
COURSE_DESCRIPTION varchar(25), 
COURSE_START_DATE Date, 
COURSE_DURATION int(11), 
NO_OF_PARTICIPANTS int(255),
COURSE_TYPE Char(3));

CREATE TABLE student_info(
STUDENT_ID varchar(10) PRIMARY KEY,
COURSE_CODE varchar(10) REFERENCES course_info(COURSE_CODE),
FIRST_NAME varchar(20), 
LAST_NAME varchar(25), 
ADDRESS varchar(150));

INSERT INTO course_fees VALUES ('7',NULL,200,25), ('8',NULL,300,50); 
INSERT INTO course_fees VALUES ('9',300,300,50),
('10',175,100,25);
SELECT * FROM course_fees;
SELECT MIN(IFNULL(base_fees,0)),MAX(base_fees) FROM course_fees;

#EXERCISE 14
SELECT COUNT(*) FROM course_fees; 
SELECT* FROM course_fees;
CREATE TABLE INFRA( sn INT primary KEY , infra_fees DECIMAL(5,3));
ALTER TABLE course_fees ADD infra_fees DECIMAL(5,3);
INSERT INTO INFRA VALUES (1,41.1239),(2,42.123),(3,43.123),(4,44.123),(10,45.123),
(6,46.123),(7,47.123),(8,48.123),(9,45.123);
SELECT DATEDIFF(curdate(),COURSE_START_DATE) FROM course_info;

#EXERCISE 13
SELECT AVG(INFRA.infra_fees) FROM course_fees INNER JOIN INFRA ON course_fees.course_code=INFRA.sn;

#EXERCISE 15 
SELECT CONCAT('<',course_name,'>','<',course_code,'>') FROM course_info;
SELECT * FROM course_info;

# EXECISE 16
SELECT AVG(IFNULL(base_fees,0)) FROM course_fees;

#EXERCISE 17 
ALTER TABLE course_info ADD Message VARCHAR(30);
INSERT INTO Course_info (Course_Code,Course_Name,Course_Type,message) VALUES ('CS06','F','CLR','Class Room'),('CS07','G','EL','ELearning'),('CS08','H','OF','Offline Reading');
SELECT* FROM course_info;
Select Course_Type, message from Course_info where Course_Type in ('CLR','EL','OF');

#EXERCISE 18
#Pre-requisite
SET SQL_SAFE_UPDATES =0;
DELETE FROM Course_info;
SELECT* FROM course_info;
INSERT INTO Course_info (Course_Code,Course_Name,Course_Type,message,COURSE_START_DATE, NO_OF_PARTICIPANTS) VALUES 
('CS06','F','CLR','Class Room','2018-01-12', '36'),
('CS07','G','EL','ELearning','2018-12-8', '52'),
('CS08','H','OF','Offline Reading','2018-08-12', '48');

SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_PARTICIPANTS FROM course_info GROUP BY course_start_date;

#EXERCISE 19
SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_PARTICIPANTS FROM course_info WHERE course_type='CLR' GROUP BY course_start_date;

#EXERCISE 20
SELECT course_start_date, SUM(NO_OF_PARTICIPANTS) as NO_OF_PARTICIPANTS FROM course_info WHERE course_type='CLR' GROUP BY course_start_date HAVING SUM(NO_OF_PARTICIPANTS)>10;

#EXERCISE 21
SELECT course_name FROM course_info ORDER BY course_duration;

#EXERCISE 22
INSERT INTO student_info VALUES ('1','168','ARIJIT','SUR','ABCD'),('2','160','AYANTIKA','SUR','XYZ'), ('3','167','AVIJIT','SUR','AF');
SELECT * FROM student_info;
SELECT student_info.student_id,student_info.first_name,student_info.last_name, course_info.course_code FROM student_info INNER JOIN course_info ON student_info.course_code WHERE student_info.course_code='167';

#EXERCISE 23
SELECT course_fees.discount, course_info.course_description FROM course_fees INNER JOIN course_info ON course_info.course_code=course_fees.course_code;

#EXCERCISE 24
INSERT INTO student_info VALUES ('8','CS08','AYANTIKA','SUR','KOLKATA, WEST BENGAL');
SELECT student_info.first_name, student_info.last_name, course_info.course_code FROM student_info LEFT JOIN course_info ON student_info.course_code=course_info.course_code;
SELECT student_info.first_name, student_info.last_name, course_info.course_code FROM course_info RIGHT JOIN student_info ON student_info.course_code=course_info.course_code;

#EXERCISE 25
SELECT* FROM course_fees;
SELECT * FROM course_info;
INSERT INTO course_info VALUES 
('CSll','l','coding','2021-01-01',50,1,'CLR','Class
 Room'),
 ('CS12','J','CLOUD','2020-02-11' ,30,1,'EL','ELearning');
INSERT INTO course_fees VALUES 
('CS11',1000,200,20,20),
('CS12','900','300',50,15);
SELECT * FROM student_info;
INSERT INTO student_info VALUES 
(4,'CSll','NEMAI','SUR','KOLKATA'), 
(6,'CS12','SUMANA','SUR','ICHAPUR');
SELECT DISTINCT student_info.student_id FROM student_info INNER JOIN course_fees ON student_info.course_code=course_fees.course_code WHERE ((base_fees+special_fees+infra_fees)*(1-discount/100))<1500;

#EXERCISE 26
SELECT DISTINCT student_info.student_id, student_info.first_name, student_info.last_name  FROM student_info INNER JOIN course_fees ON student_info.course_code=course_fees.course_code WHERE ((base_fees+special_fees+infra_fees)*(1-discount/100))<1500;































 

