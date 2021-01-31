SELECT *
INTO Employees_New
FROM Employees
WHERE Salary > 30000

DELETE FROM Employees_New
WHERE ManagerID = 42

UPDATE Employees_New
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary)
FROM Employees_New
GROUP BY DepartmentID