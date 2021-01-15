CREATE DATABASE Movies
USE Movies

CREATE TABLE Directors
(
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors
VALUES ('Valentin', null), ('Katrin', null), ('Stoyan', null)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY IDENTITY,
	GenerName NVARCHAR(90) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Genres
VALUES ('Drama', null), ('Si-Fi','Next week is the premier of the movie'), ('Action',null)

CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Categories
VALUES ('Documental', null), ('Sport','SuperBall'), ('Reality',null)

CREATE TABLE Movies
(
	Id INT PRIMARY KEY IDENTITY,
	DirectorId INT NOT NULL,
	CopyrightYear DATE,
	[Length] INT,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating TINYINT,
	Notes NVARCHAR(MAX)
)

INSERT INTO Movies
VALUES (1,'2021-01-14', 120,1,1,8,null),(2,'2020-11-01', null,5,14,7,null),(5,'1990-01-14', 360,1,1,8,null)
