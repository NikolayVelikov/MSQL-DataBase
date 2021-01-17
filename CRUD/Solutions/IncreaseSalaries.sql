UPDATE Employees
SET Salary *= 1.12
WHERE DepartmentID IN (1,2,4,11)

SELECT DISTINCT JobTitle, DepartmentID FROM Employees Where DepartmentID in (1,2,4,11)

UPDATE Employees
SET Salary = Salary*0.12
WHERE DepartmentID IN (1,2,4,11)
