CREATE PROCEDURE usp_CalculateFutureValueForAccount (@AccountID INT, @Rate FLOAT)
AS
SELECT a.Id AS [Account Id], FirstName, LastName, Balance AS [Current Balance],
dbo.ufn_CalculateFutureValue( Balance,@Rate,5 )
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
WHERE a.Id = @AccountID

EXEC dbo.usp_CalculateFutureValueForAccount 1, 0.1