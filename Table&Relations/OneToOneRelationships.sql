CREATE TABLE Passports
(
	PassportID INT IDENTITY(101,1) PRIMARY KEY,
	PassportNumber CHAR(8) UNIQUE NOT NULL
)
INSERT INTO Passports
VALUES
	('N34FG21B'),
	('K65LO4R7'),
	('ZE657QP2')

CREATE TABLE Persons
(
	PersonID INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(90) NOT NULL,
	Salary	DECIMAL(19,2),
	PassportID INT UNIQUE NOT NULL

	CONSTRAINT FK_Person_Passport FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)
)

INSERT INTO Persons
VALUES 
( 'Roberto', 43300.00, 102),
( 'Tom', 56100.00, 103),
( 'Yana', 60200.00, 101)
