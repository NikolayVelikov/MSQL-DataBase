SELECT DepartmentID, MAX(Salary) AS MaxSalary -- Variant 1
FROM(SELECT DepartmentID, Salary,
DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
FROM Employees) AS k
WHERE Rank = 3
GROUP BY DepartmentID

SELECT DISTINCT DepartmentID, Salary -- Variant 2
FROM(SELECT DepartmentID, Salary,
DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
FROM Employees) AS k
WHERE Rank = 3
