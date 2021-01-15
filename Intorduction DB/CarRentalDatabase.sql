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
VALUES ('CB1518AA','BMW','3-rd series',null,null,5,null,'Perfect',1),
	   ('CB1517AA','BMW','3-rd series',null,null,5,null,'Perfect',1),
	   ('CB1518AA','BMW','3-rd series',null,null,5,null,'Perfect',1)

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