CREATE PROCEDURE usp_EmployeesBySalaryLevel @Level NVARCHAR(10)
AS
	SELECT FirstName, LastName  
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @Level

EXEC dbo.usp_EmployeesBySalaryLevel @Level = 'high'