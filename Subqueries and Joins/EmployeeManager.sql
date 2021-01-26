SELECT emp.EmployeeID, emp.FirstName, e.EmployeeID AS ManagerID, e.FirstName AS ManagerName
FROM Employees AS emp
JOIN Employees AS e ON e.EmployeeID = emp.ManagerID
WHERE emp.ManagerID IN (3,7)
ORDER BY emp.EmployeeID