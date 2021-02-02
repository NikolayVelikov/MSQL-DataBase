CREATE PROCEDURE usp_GetTownsStartingWith @Input NVARCHAR(20)
AS
	SELECT [Name] AS Town
	FROM Towns
	WHERE [Name] LIKE @Input + '%'

EXEC dbo.usp_GetTownsStartingWith @Input = 'b'