-- Task 1 Database Design (Normalization)
CREATE DATABASE TechShop;
USE TechShop;
-- Task 2 Data Definition Language (DDL)
-- Question 1
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(20) NOT NULL,
	Phone CHAR(10) UNIQUE NOT NULL,
	Address VARCHAR(50) NOT NULL
);
CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	Description VARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL
);
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT NOT NULL,
	OrderDate DATE,
	TotalAmount FLOAT NOT NULL,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
CREATE TABLE Inventory(
	InventoryID INT PRIMARY KEY,
	ProductID INT NOT NULL,
	QuantityInStock INT NOT NULL,
	LastStockUpdate INT NOT NULL,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
-- Task 3 Data Manipulation Language (DML)
-- Question a
INSERT INTO [dbo].[Customers] VALUES(101,'MANAS','CHANDRA','manas@gmail.com','8579761334','BALAJI NAGAR, NELLORE');
INSERT INTO [dbo].[Customers] VALUES(105,'LIKHITHA','ANAND','likhitha@gmail.com','8579851391','NTR NAGAR, GUDUR');
INSERT INTO [dbo].[Customers] VALUES(107,'LOKESH','REDDY','lokesh@gmail.com','9515963308','BALAJI NAGAR, TIRUPATI');
INSERT INTO [dbo].[Customers] VALUES(102,'GURU CHARAN','CHINNI','charan@gmail.com','8777761774','SIRUSERI, CHENNAI');
INSERT INTO [dbo].[Customers] VALUES(103,'ASWITHA','REDDY','aswitha@gmail.com','7549762539','MARTHALI, BANGALORE');
INSERT INTO [dbo].[Customers] VALUES(110,'SOWMYA','SHETTY','sowmya@gmail.com','6032765339','AMEERPET, HYDERABAD');
INSERT INTO [dbo].[Customers] VALUES(108,'SOWJANYA','KUMAR','sowjanya@gmail.com','7702612829','BALAJI NAGAR, TIRUPATI');
INSERT INTO [dbo].[Customers] VALUES(104,'AKHIL','REDDY','akhil@gmail.com','7032607169','BALAJI NAGAR, NELLORE');
INSERT INTO [dbo].[Customers] VALUES(106,'MOHAN','RAO','mohanrao@gmail.com','9390518031','SIRUSERI, CHENNAI');
INSERT INTO [dbo].[Customers] VALUES(109,'DIVYESH','CHINNI','divyesh@gmail.com','9949804777','ANNA NAGAR, MUMBAI');

INSERT INTO [dbo].[Products] VALUES(1,'MOBILE','VIVO SMART PHONE',12000.54);
INSERT INTO [dbo].[Products] VALUES(2,'LAPTOP','ASUS LAPTOP',40000.00);
INSERT INTO [dbo].[Products] VALUES(4,'TABLET','SAMSUNG TABLET',50250.85);
INSERT INTO [dbo].[Products] VALUES(3,'HEADPHONES','BOAT HEADPHONES',5200.00);
INSERT INTO [dbo].[Products] VALUES(7,'MACBOOK','APPLE MACBOOK',95000.00);
INSERT INTO [dbo].[Products] VALUES(6,'KEYBOARD','WIRELESS KEYBOARD',2050.86);
INSERT INTO [dbo].[Products] VALUES(9,'MOUSE','WIRELESS MOUSE',1500.00);
INSERT INTO [dbo].[Products] VALUES(10,'TELEVISION','SAMSUNG TV',80000.00);
INSERT INTO [dbo].[Products] VALUES(5,'EARPHONES','BOAT EARPHONES',500.54);
INSERT INTO [dbo].[Products] VALUES(8,'IWATCH','APPLE WATCH',8220.55);

INSERT INTO [dbo].[Orders] VALUES(301,105,'2023-11-28',50250.85);
INSERT INTO [dbo].[Orders] VALUES(302,102,'2022-01-24',12000.54);
INSERT INTO [dbo].[Orders] VALUES(303,101,'2020-09-04',40000.00);
INSERT INTO [dbo].[Orders] VALUES(304,108,'2022-01-24',10400.00);
INSERT INTO [dbo].[Orders] VALUES(305,104,'2023-10-23',12000.54);
INSERT INTO [dbo].[Orders] VALUES(306,110,'2022-01-24',1501.62);
INSERT INTO [dbo].[Orders] VALUES(307,103,'2018-05-10',4101.72);
INSERT INTO [dbo].[Orders] VALUES(308,109,'2010-09-05',50250.85);
INSERT INTO [dbo].[Orders] VALUES(309,106,'2015-01-24',95000.00);
INSERT INTO [dbo].[Orders] VALUES(310,107,'2023-10-25',80000.00);

INSERT INTO [dbo].[OrderDetails] VALUES(401,301,4,1);
INSERT INTO [dbo].[OrderDetails] VALUES(402,302,1,1);
INSERT INTO [dbo].[OrderDetails] VALUES(403,303,2,1);
INSERT INTO [dbo].[OrderDetails] VALUES(404,304,3,2);
INSERT INTO [dbo].[OrderDetails] VALUES(405,305,1,1);
INSERT INTO [dbo].[OrderDetails] VALUES(406,306,5,3);
INSERT INTO [dbo].[OrderDetails] VALUES(407,307,6,2);
INSERT INTO [dbo].[OrderDetails] VALUES(408,308,4,1);
INSERT INTO [dbo].[OrderDetails] VALUES(409,309,7,1);
INSERT INTO [dbo].[OrderDetails] VALUES(410,310,10,1);

INSERT INTO [dbo].[Inventory] VALUES(501,1,10,100);
INSERT INTO [dbo].[Inventory] VALUES(502,2,100,250);
INSERT INTO [dbo].[Inventory] VALUES(503,3,80,220);
INSERT INTO [dbo].[Inventory] VALUES(504,4,70,525);
INSERT INTO [dbo].[Inventory] VALUES(505,5,50,201);
INSERT INTO [dbo].[Inventory] VALUES(506,6,120,300);
INSERT INTO [dbo].[Inventory] VALUES(507,7,95,450);
INSERT INTO [dbo].[Inventory] VALUES(508,8,25,505);
INSERT INTO [dbo].[Inventory] VALUES(509,9,15,235);
INSERT INTO [dbo].[Inventory] VALUES(510,10,135,255);
-- Task 3 Data Manipulation Language (DML)
-- Question b1
SELECT CONCAT([FirstName],' ',[LastName]) 'Name',[Email] FROM [dbo].[Customers];
-- Question b2
SELECT O.[OrderID],O.[OrderDate],CONCAT(C.[FirstName],' ',C.[LastName]) 'Name' 
FROM [dbo].[Orders] AS O,[dbo].[Customers] AS C 
WHERE O.[CustomerID] = C.[CustomerID];
-- Question b3
INSERT INTO [dbo].[Customers] VALUES(111,'MANASA','ALAPAKA','manasa@gmail.com','8579751334','BALAJI NAGAR, TIRUPATI');
SELECT * FROM [dbo].[Customers];
-- Question b4
UPDATE [dbo].[Products] SET [Price] = [Price] * 1.10;
SELECT * FROM [dbo].[Products];
-- Question b5
DECLARE @OID INT;
SET @OID = 305;
DELETE FROM [dbo].[Orders] WHERE [OrderID] = @OID;
SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[OrderDetails];
-- Question b6
INSERT INTO [dbo].[Orders] VALUES(311,111,'2023-11-28',50250.85);
SELECT * FROM [dbo].[Orders];
INSERT INTO [dbo].[OrderDetails] VALUES(411,311,4,1);
SELECT * FROM [dbo].[OrderDetails];
-- Question b7
DECLARE @CID INT, @EMAIL VARCHAR(20), @ADDRESS VARCHAR(50);
SET @CID = 105;
SET @EMAIL = 'likhi@gmail.com';
SET @ADDRESS = 'ANNA NAGAR, MUMBAI';
UPDATE [dbo].[Customers] SET [Email] = @EMAIL, [Address] = @ADDRESS WHERE [CustomerID] = @CID;
SELECT * FROM [dbo].[Customers];
-- Question b8
UPDATE [dbo].[Orders] SET [TotalAmount] = (
SELECT [dbo].[Products].[Price] * [dbo].[OrderDetails].[Quantity] FROM [dbo].[OrderDetails]
INNER JOIN [dbo].[Products] ON [dbo].[OrderDetails].[ProductID] = [dbo].[Products].[ProductID]
WHERE [dbo].[OrderDetails].[OrderID] = [dbo].[Orders].[OrderID]
);
SELECT * FROM [dbo].[Orders];
-- Question b9
DECLARE @CCID INT;
SET @CCID = 106;
DELETE FROM [dbo].[Orders] WHERE [CustomerID] = @CCID;
SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[OrderDetails];
-- Question b10
INSERT INTO [dbo].[Products] VALUES(11,'SPEAKERS','SAMSUNG BLUETOOTH SPEAKERS',35000.00);
SELECT * FROM [dbo].[Products];
-- Question b11
DECLARE @OOID INT;
SET @OOID = 304;
UPDATE [dbo].[Orders] SET [OrderDate] = '2023-01-24' WHERE [OrderID] = @OOID;
SELECT * FROM [dbo].[Orders];
-- Question b12
SELECT C.[CustomerID],COUNT(O.[OrderID]) 'NoOfOrders'
FROM [dbo].[Orders] AS O,[dbo].[Customers] AS C 
WHERE O.[CustomerID] = C.[CustomerID]
GROUP BY C.[CustomerID];
-- Task 4 Joins
-- Question 1
SELECT [OrderID],[OrderDate],[TotalAmount],C.*
FROM [dbo].[Orders] AS O
INNER JOIN [dbo].[Customers] AS C
ON O.[CustomerID] = C.[CustomerID];
-- Question 2
SELECT [ProductName],[Price] * OD.[Quantity] 'TotalRevenue'
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID];
-- Question 3
SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',C.[Email],C.[Phone]
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
WHERE O.[TotalAmount] > 0;
-- Question 4
SELECT P.[ProductName],OD.[Quantity]
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
-- Question 5
SELECT [ProductName],[Description] 'Category' FROM [dbo].[Products];
-- Question 6
SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',AVG(O.[TotalAmount]) 'AverageOrderValue'
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
GROUP BY CONCAT(C.[FirstName],' ',C.[LastName]);
-- Question 7
SELECT OD.[OrderID],O.[CustomerID],P.[Price] * OD.[Quantity] 'TotalRevenue'
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
INNER JOIN [dbo].[Orders] AS O
ON OD.[OrderID] = O.[OrderID]
ORDER BY 3 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
-- Question 8
SELECT P.[ProductName],COUNT(OD.[OrderID]) 'OrderCount'
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
GROUP BY P.[ProductName];
-- Question 9
DECLARE @PN VARCHAR(50);
SET @PN = 'TABLET';
SELECT C.[CustomerID],CONCAT(C.[FirstName],' ',C.[LastName]) 'Name'
FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
INNER JOIN [dbo].[OrderDetails] AS OD
ON O.[OrderID] = OD.[OrderID]
INNER JOIN [dbo].[Products] AS P
ON OD.[ProductID] = P.[ProductID]
WHERE P.[ProductName] = @PN;
-- Question 10
DECLARE @ST DATE, @EN DATE;
SET @ST = '2023-01-01';
SET @EN = '2023-12-31';
SELECT P.[Price] * OD.[Quantity] 'TotalRevenue'
FROM [dbo].[Products] AS P
JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
JOIN [dbo].[Orders] AS O
ON OD.[OrderID] = O.[OrderID]
WHERE O.[OrderDate] BETWEEN @ST AND @EN;
-- Task 4 Aggregate Functions and Subqueries
-- Question 1
SELECT C.[CustomerID],CONCAT(C.[FirstName],' ',C.[LastName]) 'Name'
FROM [dbo].[Customers] AS C
WHERE C.[CustomerID] NOT IN
(SELECT O.[CustomerID] FROM [dbo].[Orders] AS O);
-- Question 2
SELECT COUNT([ProductID]) 'NoOfProductsAvailable' FROM [dbo].[Inventory] WHERE [QuantityInStock] > 0;
-- Question 3
SELECT SUM(P.[Price] * OD.[Quantity]) 'TotalRevenue'
FROM [dbo].[Products] AS P
JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID];
-- Question 4
DECLARE @PC VARCHAR(50);
SET @PC = 'MOBILE';
SELECT AVG(OD.[Quantity]) 'AverageQuantityOrdered'
FROM [dbo].[OrderDetails] AS OD
JOIN [dbo].[Products] AS P
ON OD.[ProductID] = P.[ProductID]
WHERE P.[ProductName] = @PC;
-- Question 5
DECLARE @C INT;
SET @C = 101;
SELECT P.[Price] * OD.[Quantity] 'TotalRevenue'
FROM [dbo].[Products] AS P
JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
JOIN [dbo].[Orders] AS O
ON OD.[OrderID] = O.[OrderID]
JOIN [dbo].[Customers] AS C
ON O.[CustomerID] = C.[CustomerID]
WHERE C.[CustomerID] = @C;
-- Question 6
SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',COUNT(O.[OrderID]) 'OrderCount'
FROM [dbo].[Customers] AS C
JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
GROUP BY CONCAT(C.[FirstName],' ',C.[LastName])
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',COUNT(O.[OrderID]) 'OrderCount'
FROM [dbo].[Customers] AS C
JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
GROUP BY CONCAT(C.[FirstName],' ',C.[LastName]);
-- Question 7
SELECT P.[ProductName],OD.[Quantity]
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[OrderDetails] AS OD
ON P.[ProductID] = OD.[ProductID]
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
-- Question 8
SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',P.[Price] * OD.[Quantity] 'TotalRevenue'
FROM [dbo].[Customers] AS C
JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
JOIN [dbo].[OrderDetails] AS OD
ON O.[OrderID] = OD.[OrderID]
JOIN [dbo].[Products] AS P
ON OD.[ProductID] = P.[ProductID]
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
-- Question 9
SELECT C.[CustomerID],AVG(P.[Price] * OD.[Quantity]) 'AverageOrderValue'
FROM [dbo].[Products] AS P
JOIN [dbo].[OrderDetails] AS OD
ON OD.[ProductID] = P.[ProductID]
JOIN [dbo].[Orders] AS O
ON OD.[OrderID] = O.[OrderID]
JOIN [dbo].[Customers] AS C
ON O.[CustomerID] = C.[CustomerID]
GROUP BY C.[CustomerID];
-- Question 10
SELECT CONCAT(C.[FirstName],' ',C.[LastName]) 'Name',COUNT(O.[OrderID]) 'OrderCount'
FROM [dbo].[Customers] AS C
JOIN [dbo].[Orders] AS O
ON C.[CustomerID] = O.[CustomerID]
GROUP BY CONCAT(C.[FirstName],' ',C.[LastName]);