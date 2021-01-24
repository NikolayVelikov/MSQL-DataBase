--CREATE TABLE Peoples
--(
--	Id INT PRIMARY KEY IDENTITY,
--	[NAME] NVARCHAR(50) NOT NULL,
--	Birtdate DATE NOT NULL
--)
--
--INSERT INTO Peoples
--VALUES ('Victor', '2000-12-07 00:00:00.000'),
--	   ('Steven', '1992-09-10 00:00:00.000'),
--	   ('Stephen', '1910-09-19 00:00:00.000'),
--       ('John', '2010-01-06 00:00:00.000')

SELECT 
Name, 
(DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, Peoples.Birtdate)) AS [Age in Years],
(DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, Peoples.Birtdate)) * 12 AS [Age in Months]
FROM Peoples
