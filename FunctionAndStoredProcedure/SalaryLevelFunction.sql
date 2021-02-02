CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @Temp NVARCHAR(10);

	IF(@salary < 30000)
		BEGIN
			SET @Temp = 'Low';
		END
	ELSE IF(@salary BETWEEN 30000 AND 50000)
		BEGIN
			SET @Temp = 'Average';
		END
	ELSE
		BEGIN
			SET @Temp = 'High'
		END

	RETURN @Temp
END

SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level]
FROM Employees

SELECT *
FROM Employees