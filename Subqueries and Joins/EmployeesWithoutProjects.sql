SELECT  TOP(3) e.EmployeeID, e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ap ON ap.EmployeeID = e.EmployeeID
WHERE ap.EmployeeID IS NULL
ORDER BY e.EmployeeID