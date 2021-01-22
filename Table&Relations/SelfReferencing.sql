CREATE DATABASE Self_Referencing
USE Self_Referencing

CREATE TABLE Teachers
(
	TeacherID INT IDENTITY(101,1) PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,	
	ManagerID INT,		
)

ALTER TABLE Teachers
ADD CONSTRAINT FK_ManagerID_TeacherID FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)

INSERT INTO Teachers
VALUES 
 ('John',	NULL ),
 ('Maya',	106	 ),
 ('Silvia',	106	 ),
 ('Ted',	105	 ),
 ('Mark',	101	 ),
 ('Greta',	101	 )