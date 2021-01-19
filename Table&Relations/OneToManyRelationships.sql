CREATE TABLE Manufacturers
(
	ManufacturerID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) UNIQUE NOT NULL,
	EstablishedOn DATE NOT NULL,
)

INSERT INTO Manufacturers
VALUES 
	('BMW','1916-03-07'),
	('Tesla','2003-01-01'),
	('Lada','1966-05-01')

	SELECT * FROM Manufacturers

CREATE TABLE Models
(
	ModelID INT PRIMARY KEY IDENTITY(101,1),
	[Name] NVARCHAR(100) NOT NULL,
	ManufacturerID INT NOT NULL
	
	CONSTRAINT FK_Model_Manufacturer FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

SELECT Models.Name AS Model, Manufacturers.Name AS Brand, Manufacturers.EstablishedOn FROM Models
JOIN Manufacturers ON
Models.ManufacturerID = Manufacturers.ManufacturerID