-- Task 1 Database Design (Normalization)
CREATE DATABASE SISDB;
USE SISDB;
-- Task 2 Data Definition Language (DDL)
-- Question 1
CREATE TABLE Students(
	student_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	email VARCHAR(100) NOT NULL,
	phone_number VARCHAR(10) UNIQUE NOT NULL
);
CREATE TABLE Teacher(
	teacher_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
);
CREATE TABLE Courses(
	course_id INT PRIMARY KEY,
	course_name VARCHAR(50) NOT NULL,
	credits INT NOT NULL,
	teacher_id INT NOT NULL,
	FOREIGN KEY(teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE
);
CREATE TABLE Enrollments(
	enrollment_id INT PRIMARY KEY,
	student_id INT NOT NULL,
	course_id INT NOT NULL,
	enrollment_date DATE NOT NULL,
	FOREIGN KEY(student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
	FOREIGN KEY(course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
CREATE TABLE Payments(
	payment_id INT PRIMARY KEY,
	student_id INT NOT NULL,
	amount FLOAT NOT NULL,
	payment_date DATE NOT NULL,
	FOREIGN KEY(student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);
-- Task 3 Data Manipulation Language (DML)
-- Question a
INSERT INTO [dbo].[Students] VALUES(101,'MANAS','CHANDRA','2002-07-13','manas@gmail.com','9949804777');
INSERT INTO [dbo].[Students] VALUES(102,'DIVYESH','CHINNI','2002-07-28','divyesh@gmail.com','8579851391');
INSERT INTO [dbo].[Students] VALUES(103,'HARSHA','VARDHAN','2002-11-12','harsha@gmail.com','9515963308');
INSERT INTO [dbo].[Students] VALUES(104,'GURU','PRASAD','2002-06-01','guru@gmail.com','9390518031');
INSERT INTO [dbo].[Students] VALUES(105,'GREESHMANTH','REDDY','2002-06-01','greeshu@gmail.com','7600254565');
INSERT INTO [dbo].[Students] VALUES(106,'MADEEP','KUMAR','2001-05-15','madeep@gmail.com','5664646123');
INSERT INTO [dbo].[Students] VALUES(107,'KISHORE','KUMAR','2001-02-12','kish@gmail.com','6300202896');
INSERT INTO [dbo].[Students] VALUES(108,'MOUNIKER','REDDY','2002-07-14','mouniker@gmail.com','6467979851');
INSERT INTO [dbo].[Students] VALUES(109,'VISHWA','ACHARI','2002-01-14','vishwa@gmail.com','7032607619');
INSERT INTO [dbo].[Students] VALUES(110,'HEMANTH','KUMAR','2002-07-27','hemanth@gmail.com','7546798420');

INSERT INTO [dbo].[Teacher] VALUES(201,'KUSUMA','PRIYA','kp@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(202,'SHALINI','I','si@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(203,'BHARATH','KUMAR','bk@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(204,'PRASANTH','PENCHALA','pp@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(205,'JEEVAN','KUMAR','jk@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(206,'RAJU','KUMAR','rk@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(207,'RAJESH','SHARMA','rs@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(208,'PRIYA','THAKUR','pt@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(209,'ANJALI','REDDY','ar@gmail.com');
INSERT INTO [dbo].[Teacher] VALUES(210,'SUNIL','RAO','sr@gmail.com');

INSERT INTO [dbo].[Courses] VALUES(301,'JAVA',5,201);
INSERT INTO [dbo].[Courses] VALUES(302,'PYTHON',4,202);
INSERT INTO [dbo].[Courses] VALUES(303,'C#',6,203);
INSERT INTO [dbo].[Courses] VALUES(304,'C',3,204);
INSERT INTO [dbo].[Courses] VALUES(305,'C++',4,205);
INSERT INTO [dbo].[Courses] VALUES(306,'HTML',5,206);
INSERT INTO [dbo].[Courses] VALUES(307,'JAVASCRIPT',5,207);
INSERT INTO [dbo].[Courses] VALUES(308,'CSS',2,208);
INSERT INTO [dbo].[Courses] VALUES(309,'AI',8,209);
INSERT INTO [dbo].[Courses] VALUES(310,'ML',7,210);

INSERT INTO [dbo].[Enrollments] VALUES(401,101,305,'2023-11-30');
INSERT INTO [dbo].[Enrollments] VALUES(402,102,307,'2023-10-25');
INSERT INTO [dbo].[Enrollments] VALUES(403,103,304,'2023-09-20');
INSERT INTO [dbo].[Enrollments] VALUES(404,104,307,'2023-08-15');
INSERT INTO [dbo].[Enrollments] VALUES(405,105,303,'2023-07-10');
INSERT INTO [dbo].[Enrollments] VALUES(406,106,302,'2023-06-05');
INSERT INTO [dbo].[Enrollments] VALUES(407,107,301,'2023-05-01');
INSERT INTO [dbo].[Enrollments] VALUES(408,108,301,'2023-04-15');
INSERT INTO [dbo].[Enrollments] VALUES(409,109,308,'2023-03-20');
INSERT INTO [dbo].[Enrollments] VALUES(410,110,309,'2023-02-10');
INSERT INTO [dbo].[Enrollments] VALUES(415,101,306,'2023-01-01');

INSERT INTO [dbo].[Payments] VALUES(501,101,500.00,'2023-12-01');
INSERT INTO [dbo].[Payments] VALUES(502,102,1500.00,'2023-10-26');
INSERT INTO [dbo].[Payments] VALUES(503,103,2000.00,'2023-09-21');
INSERT INTO [dbo].[Payments] VALUES(504,104,1500.00,'2023-08-16');
INSERT INTO [dbo].[Payments] VALUES(505,105,1500.00,'2023-07-11');
INSERT INTO [dbo].[Payments] VALUES(506,106,500.00,'2023-06-06');
INSERT INTO [dbo].[Payments] VALUES(507,107,3000.00,'2023-05-02');
INSERT INTO [dbo].[Payments] VALUES(508,108,3000.00,'2023-04-16');
INSERT INTO [dbo].[Payments] VALUES(509,109,2800.00,'2023-03-21');
INSERT INTO [dbo].[Payments] VALUES(510,110,3500.00,'2023-02-11');
INSERT INTO [dbo].[Payments] VALUES(511,101,3550.00,'2023-02-01');
-- Task 3 Data Manipulation Language (DML)
-- Question b1
INSERT INTO [dbo].[Students] VALUES(111,'John','Doe','1995-08-15','john.doe@example.com','1234567890');
SELECT * FROM [dbo].[Students];
-- Question b2
INSERT INTO [dbo].[Enrollments] VALUES(411,111,301,'2023-11-30');
SELECT * FROM [dbo].[Enrollments];
-- Question b3
UPDATE [dbo].[Teacher] SET [email] = 'shalini@gmail.com' WHERE [teacher_id] = 202;
SELECT * FROM [dbo].[Teacher];
-- Question b4
DELETE FROM [dbo].[Enrollments] WHERE [student_id] = 103 AND [course_id] = 304;
SELECT * FROM [dbo].[Enrollments];
-- Question b5
UPDATE [dbo].[Courses] SET [teacher_id] = 202 WHERE [course_name] = 'C++';
SELECT * FROM [dbo].[Courses];
-- Question b6
DELETE FROM [dbo].[Students] WHERE [student_id] = 104;
SELECT * FROM [dbo].[Students];
SELECT * FROM [dbo].[Enrollments];
-- Question b7
UPDATE [dbo].[Payments] SET [amount] = 2500 WHERE [payment_id] = 502;
SELECT * FROM [dbo].[Payments];
-- Task 4 Joins
-- Question 1
SELECT P.*,S.[first_name],S.[last_name] FROM [dbo].[Payments] AS P
JOIN [dbo].[Students] AS S
ON P.[student_id] = S.[student_id];
-- Question 2
SELECT C.[course_name],COUNT(E.[student_id]) 'no_of_students_enrolled' FROM [dbo].[Courses] AS C
LEFT JOIN [dbo].[Enrollments] AS E
ON C.[course_id] = E.[course_id]
GROUP BY C.[course_name];
-- Question 3
SELECT CONCAT(S.[first_name],' ',S.[last_name]) 'name' FROM [dbo].[Students] AS S
LEFT JOIN [dbo].[Enrollments] AS E
ON S.[student_id] = E.[student_id]
GROUP BY CONCAT(S.[first_name],' ',S.[last_name]) 
HAVING COUNT(E.[student_id]) = 0;
-- Question 4
SELECT S.[first_name],S.[last_name],C.[course_name] FROM [dbo].[Students] AS S
JOIN [dbo].[Enrollments] AS E
ON S.[student_id] = E.[student_id]
JOIN [dbo].[Courses] AS C
ON E.[course_id] = C.[course_id];
-- Question 5
SELECT CONCAT(T.[first_name],' ',T.[last_name]) 'name',C.[course_name] FROM [dbo].[Teacher] AS T
LEFT JOIN [dbo].[Courses] AS C
ON T.[teacher_id] = C.[teacher_id];
-- Question 6
SELECT S.*,E.[enrollment_date] FROM [dbo].[Students] AS S
JOIN [dbo].[Enrollments] AS E
ON S.[student_id] = E.[student_id]
JOIN [dbo].[Courses] AS C
ON E.[course_id] = C.[course_id]
WHERE C.[course_name] = 'PYTHON';
-- Question 7
SELECT CONCAT(S.[first_name],' ',S.[last_name]) 'name' FROM [dbo].[Students] AS S
LEFT JOIN [dbo].[Payments] AS P
ON S.[student_id] = P.[student_id]
WHERE P.[amount] IS NULL;
-- Question 8
SELECT C.[course_name] FROM [dbo].[Courses] AS C
LEFT JOIN [dbo].[Enrollments] AS E
ON C.[course_id] = E.[course_id]
WHERE E.[enrollment_id] IS NULL;
-- Question 9
SELECT E.[student_id] FROM [dbo].[Enrollments] AS E
JOIN [dbo].[Enrollments]
ON E.[enrollment_id] = [dbo].[Enrollments].[enrollment_id]
GROUP BY E.[student_id]
HAVING COUNT(E.[student_id]) > 1;
-- Question 10
SELECT CONCAT(T.[first_name],' ',T.[last_name]) 'name' FROM [dbo].[Teacher] AS T
LEFT JOIN [dbo].[Courses] AS C
ON T.[teacher_id] = C.[teacher_id]
WHERE C.[course_id] IS NULL;
-- Task 4 Aggregate Functions and Subqueries
-- Question 1
SELECT [course_id],AVG(cnt) 'average_no_of_students_enrolled' 
FROM
(SELECT [course_id],COUNT([enrollment_id]) 'cnt' 
FROM [dbo].[Enrollments]
GROUP BY [course_id])
AS AverageCourseCounts
GROUP BY [course_id];
-- Question 2
SELECT S.*,P.[amount] FROM [dbo].[Payments] AS P
JOIN [dbo].[Students] AS S
ON P.[student_id] = S.[student_id]
WHERE P.[amount] =
(SELECT MAX([amount]) FROM [dbo].[Payments]);
-- Question 3
SELECT [course_name] FROM [dbo].[Courses]
WHERE [course_id] IN
(SELECT [course_id] FROM [dbo].[Enrollments]
GROUP BY [course_id]
ORDER BY COUNT([enrollment_id]) DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY);
-- Question 4
SELECT T.[teacher_id],
(SELECT SUM(P.[amount]) FROM [dbo].[Payments] AS P
INNER JOIN [dbo].[Enrollments] AS E 
ON P.[student_id] = E.[student_id]
INNER JOIN [dbo].[Courses] AS C
ON E.[course_id] = C.[course_id]
WHERE C.[teacher_id] = T.[teacher_id]
) AS total_payments
FROM [dbo].[Teacher] AS T;
-- Question 5
SELECT E.[student_id] FROM [dbo].[Enrollments] AS E
FULL JOIN [dbo].[Courses] AS C
ON E.[course_id] = C.[course_id]
GROUP BY E.[student_id] 
HAVING COUNT(E.[course_id]) =
(SELECT COUNT([course_id]) FROM [dbo].[Courses]);
-- Question 6
SELECT CONCAT(T.[first_name],' ',T.[last_name]) 'name' FROM [dbo].[Teacher] AS T
WHERE [teacher_id] NOT IN
(SELECT [teacher_id] FROM [dbo].[Courses]);
-- Question 7
SELECT AVG(age) 'average_age' 
FROM
(SELECT DATEDIFF(YEAR,[date_of_birth],GETDATE()) 'age'
FROM [dbo].[Students])
AS StudentsAge;
-- Question 8
SELECT * FROM [dbo].[Courses]
WHERE [course_id] NOT IN
(SELECT [course_id] FROM [dbo].[Enrollments]);
-- Question 9
SELECT S.[student_id],
(SELECT SUM(P.[amount]) FROM [dbo].[Payments] AS P
INNER JOIN [dbo].[Enrollments] AS E 
ON P.[student_id] = E.[student_id]
WHERE P.[student_id] = S.[student_id]
) AS total_payments
FROM [dbo].[Students] AS S;
-- Question 10
SELECT * FROM [dbo].[Students]
WHERE [student_id] IN
(SELECT [student_id] FROM [dbo].[Payments]
GROUP BY [student_id]
HAVING COUNT([student_id]) > 1);
-- Question 11
SELECT S.[student_id],SUM(P.[amount]) 'total_payment' FROM [dbo].[Students] AS S
JOIN [dbo].[Payments] AS P
ON S.[student_id] = P.[student_id]
GROUP BY S.[student_id];
-- Question 12
SELECT C.[course_name],COUNT(E.[student_id]) 'no_of_students_enrolled' FROM [dbo].[Courses] AS C
FULL JOIN [dbo].[Enrollments] AS E
ON C.[course_id] = E.[course_id]
GROUP BY C.[course_name];
-- Question 13
SELECT P.[student_id],AVG(P.[amount]) 'average_payment_amount' FROM [dbo].[Payments] AS P
JOIN [dbo].[Students] AS S
ON P.[student_id] = S.[student_id]
GROUP BY P.[student_id];