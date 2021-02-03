CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@Value DECIMAL(18,2))
AS
SELECT FirstName, LastName
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id	
GROUP BY FirstName, LastName
HAVING SUM(Balance) > @Value
ORDER BY FirstName, LastName