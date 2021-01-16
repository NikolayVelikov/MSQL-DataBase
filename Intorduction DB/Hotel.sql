CREATE DATABASE Hotel
USE Hotel

CREATE TABLE Employees 
(	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	Title VARCHAR(4),
	Notes NVARCHAR(MAX)
)
INSERT INTO Employees
VALUES ('Nikolay','Velikov','Mr','He will be the great programer'),
	   ('Simona','Vasileva','Miss','She will be the great marketing specialist'),
	   ('Todor','Margarov','Mr.',null)

CREATE TABLE Customers 
(
	AccountNumber INT PRIMARY KEY, 
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	PhoneNumber VARCHAR(20), 
	EmergencyName NVARCHAR(50), 
	EmergencyNumber INT, 
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers
VALUES (126,'Nik','Vel','0878553345',null,null,null),
	   (127,'Nik','Vel','0878553345',null,null,null),
	   (128,'Nik','Vel','0878553345',null,null,null)

CREATE TABLE RoomStatus 
(
	RoomStatus BIT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO RoomStatus
VALUES (1,NULL), (0, NULL),(1,NULL)

CREATE TABLE RoomTypes 
(	
	RoomType VARCHAR(15) NOT NULL,
	Notes NVARCHAR(MAX)
)
INSERT INTO RoomTypes
VALUES  ('Apartment',null),
		('2 rooms',null),
		('Room',null)


CREATE TABLE BedTypes 
(
	BedType VARCHAR(20) NOT NULL, 
	Notes NVARCHAR(MAX)
)
INSERT INTO BedTypes
VALUES ('Busy',null), ('Free',null), ('Busy',null)

CREATE TABLE Rooms 
(
	RoomNumber VARCHAR(30) PRIMARY KEY, 
	RoomType VARCHAR(15) NOT NULL, 
	BedType VARCHAR(20) NOT NULL, 
	Rate DECIMAL(9,2) NOT NULL, 
	RoomStatus BIT NOT NULL, 
	Notes NVARCHAR(MAX)
)
INSERT INTO Rooms
VALUES  (123,'Apartment','Busy',250.257,1,null), 
		(124,'Apartment','Busy',250.2579,1,null), 
		(125,'Apartment','Busy',25000.257,1,null)

CREATE TABLE Payments 
(
	Id INT PRIMARY KEY, 
	EmployeeId INT NOT NULL,
	PaymentDate DATE,
	AccountNumber INT NOT NULL, 
	FirstDateOccupied DATE NOT NULL, 
	LastDateOccupied DATE NOT NULL, 
	TotalDays INT, 
	AmountCharged DECIMAL(9,2) NOT NULL, 
	TaxRate FLOAT(2), 
	TaxAmount FLOAT(2), 
	PaymentTotal DECIMAL(9,2), 
	Notes NVARCHAR(MAX)
)
INSERT INTO Payments
VALUES  (1,1,'2020-10-01',1234415,'2020-09-01','2020-12-15',null,123.55,null,null,null,null),
	    (2,1,'2020-10-01',1234415,'2020-09-01','2020-12-15',null,123.55,null,null,null,null),
		(3,1,'2020-10-01',1234415,'2020-09-01','2020-12-15',null,123.55,null,null,null,null)

CREATE TABLE Occupancies 
(
	Id INT PRIMARY KEY,
	EmployeeId INT UNIQUE, 
	DateOccupied DATE NOT NULL, 
	AccountNumber INT UNIQUE, 
	RoomNumber VARCHAR(30) NOT NULL, 
	RateApplied FLOAT(2), 
	PhoneCharge VARCHAR(20), 
	Notes NVARCHAR(MAX)
)

INSERT INTO Occupancies
VALUES  (1,123,'2020-10-14',1563158,256,NULL,NULL,NULL),
		(2,125,'2020-10-14',1563558,256,NULL,NULL,NULL),
		(3,127,'2020-10-14',1566158,256,NULL,NULL,NULL)

