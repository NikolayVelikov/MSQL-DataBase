CREATE DATABASE CarRental
USE CarRental

CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(50),
	DailyRate TINYINT,
	WeeklyRate TINYINT NOT NULL,
	MonthlyRate TINYINT,
	WeekendRate TINYINT NOT NULL,
)
ALTER TABLE Categories
ALTER COLUMN CategoryName VARCHAR(50) NOT NULL;

INSERT INTO Categories
VALUES ('VAN',null,10,null,10),('Coupe',null,7,null,10),('Sport',null,15,null,11)

CREATE TABLE Cars
(
	Id INT PRIMARY KEY IDENTITY,
	PlateNumber CHAR(8) NOT NULL, 
	Manufacturer NVARCHAR(30) NOT NULL, 
	Model NVARCHAR(30) NOT NULL,
	CarYear DATE,
	CategoryId INT,
	Doors TINYINT, 
	Picture NVARCHAR(MAX),
	Condition NVARCHAR(100),
	Available BIT NOT NULL
)
ALTER TABLE Cars ADD UNIQUE(PlateNumber)

INSERT INTO Cars
VALUES ('CB1515AA','BMW','3-rd series',null,null,5,null,'Perfect',1),
	   ('CB1516AA','BMW','3-rd series',null,null,5,null,'Perfect',1),
	   ('CB1517AA','BMW','3-rd series',null,null,5,null,'Perfect',1)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY, 
	FirstName NVARCHAR(30) NOT NULL, 
	LastName NVARCHAR(30) NOT NULL, 
	Title VARCHAR(5), 
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees
VALUES ('Petar','Petrov',null,null),
	   ('Dragan','Petrov',null,null),
	   ('Petkan','Petrov',null,null)

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY, 
	DriverLicenceNumber VARCHAR(30) NOT NULL,
	FullName NVARCHAR(90) NOT NULL,
	[Address] NVARCHAR(150),
	City NVARCHAR(30), 
	ZIPCode NVARCHAR(30),
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers
VALUES ('1234567ABC','Ettore Bugatti', null,null,null,null),
	   ('123456789ABCDE','Ettore Bugatti', null,null,null,null),
	   ('1234567ABCDE','Ettore Bugatti', null,null,null,null)

CREATE TABLE RentalOrders
(
	   Id INT PRIMARY KEY IDENTITY,
	   EmployeeId INT NOT NULL,
	   CustomerId INT NOT NULL,
	   CarId INT NOT NULL, 
	   TankLevel TINYINT NOT NULL, 
	   KilometrageStart SMALLINT NOT NULL,
	   KilometrageEnd SMALLINT NOT NULL, 
	   TotalKilometrage  SMALLINT NOT NULL,
	   StartDate DATE NOT NULL, 
	   EndDate DATE NOT NULL, 
	   TotalDays SMALLINT, 
	   RateApplied FLOAT(2) NOT NULL, 
	   TaxRate FLOAT(2) NOT NULL, 
	   OrderStatus BIT NOT NULL, 
	   Notes NVARCHAR(MAX)
)
ALTER TABLE RentalOrders
ALTER COLUMN TankLevel FLOAT(2) NOT NULL;
ALTER TABLE RentalOrders
ALTER COLUMN KilometrageStart INT NOT NULL;
ALTER TABLE RentalOrders
ALTER COLUMN KilometrageEnd INT NOT NULL;
ALTER TABLE RentalOrders
ALTER COLUMN TotalKilometrage  INT NOT NULL;

INSERT INTO RentalOrders
VALUES (1,2,3,55,52333,55485,55485,'2020-10-14','2021-01-14',null,12.5578,1235.565689,1,null),
	   (1,2,3,55,52333,55485,55485,'2020-10-14','2021-01-14',null,12.5578,1235.565689,1,null),
	   (1,2,3,55,52333,55485,55485,'2020-10-14','2021-01-14',null,12.5578,1235.565689,1,null)
	   
SELECT * FROM RentalOrders