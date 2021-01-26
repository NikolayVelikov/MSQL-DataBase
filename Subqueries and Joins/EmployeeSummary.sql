SELECT TOP(50) emp.EmployeeID, CONCAT(emp.FirstName,' ',emp.LastName) AS EmployeeName, CONCAT(e.FirstName,' ',e.LastName )AS ManagerName, d.Name AS DepartmentName
FROM Employees AS emp
JOIN Employees AS e ON e.EmployeeID = emp.ManagerID
JOIN Departments AS d ON d.DepartmentID = emp.DepartmentID
ORDER BY emp.EmployeeID