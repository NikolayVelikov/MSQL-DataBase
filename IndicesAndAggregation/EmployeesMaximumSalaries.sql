SELECT DepartmentID, MaxSalary
FROM 
(
	SELECT DepartmentID, MAX(Salary) AS MaxSalary
	FROM Employees
	GROUP BY DepartmentID
) AS [Max]
WHERE MaxSalary < 30000 OR MaxSalary > 70000