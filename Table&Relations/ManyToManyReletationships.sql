CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL
)

CREATE TABLE Exams
(
	ExamID INT PRIMARY KEY IDENTITY(101,1),
	[Name] VARCHAR(30) NOT NULL UNIQUE
)

INSERT INTO Students
VALUES ('Mila'), ('Toni'), ('Ron')

INSERT INTO Exams
VALUES ('SpringMVC'), ('Neo4j'), ('Oracle 11g')

CREATE TABLE StudentsExams
(
	StudentID INT NOT NULL,
	ExamID INT NOT NULL

	CONSTRAINT PK_Student_Exam PRIMARY KEY (StudentID,ExamID),
	CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_Exam FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)

INSERT INTO StudentsExams
VALUES 
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)

