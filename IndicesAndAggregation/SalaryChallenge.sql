SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID -- Variant 1 by joining new table
FROM Employees AS e
JOIN
(
	SELECT DepartmentID, AVG(Salary) AS MidSalary
	FROM Employees
	GROUP BY DepartmentID
) AS k ON k.DepartmentID = e.DepartmentID
WHERE e.Salary > k.MidSalary
ORDER BY e.DepartmentID

SELECT TOP(10) FirstName, LastName, DepartmentID -- Variant 2 by where function
	FROM Employees AS emp
	WHERE emp.Salary > (SELECT AVG(Salary)
					FROM Employees
					WHERE DepartmentID = emp.DepartmentID
					GROUP BY DepartmentID)
	Order BY DepartmentID
