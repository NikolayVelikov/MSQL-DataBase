CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(MAX))
RETURNS INT							
AS
BEGIN	
	DECLARE @Count INT;
	
	SET @Count = (SELECT COUNT(*)
						FROM Users AS u
						JOIN Commits AS c ON c.ContributorId = u.Id
						WHERE u.Username = @username)	
	RETURN @Count;
END

SELECT dbo.udf_AllUserCommits('UnderSinduxrein')