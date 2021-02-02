CREATE FUNCTION ufn_IsWordComprised (@setOfLetters NVARCHAR(255), @word NVARCHAR(255))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1;
	DECLARE @letter CHAR(1);
	WHILE(LEN(@word) >= @i)
		BEGIN
			SET @letter = SUBSTRING(@word, @i,1); -- possible problem
			IF(CHARINDEX(@letter, @setOfLetters) = 0)
				BEGIN
				RETURN 0
				END
			SET @i = @i + 1;
		END
	RETURN 1
END