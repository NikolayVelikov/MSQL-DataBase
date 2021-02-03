CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(250))
RETURNS TABLE
AS
	RETURN (SELECT SUM(k.TotalCash) AS TotalCash
	FROM(SELECT Cash AS TotalCash, 
			ROW_NUMBER() OVER(ORDER BY Cash DESC) AS RownNumber
		FROM Games AS g
		JOIN UsersGames AS ug ON ug.GameId = g.Id
		WHERE Name = @gameName) AS k		
	WHERE k.RownNumber % 2 = 1)