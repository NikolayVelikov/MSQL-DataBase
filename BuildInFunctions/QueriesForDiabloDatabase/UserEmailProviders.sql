SELECT Username, REPLACE(SUBSTRING(Email,CHARINDEX('@',Email,1),LEN(Email)),'@','') AS EmailProvider
FROM Users
ORDER BY SUBSTRING(Email,CHARINDEX('@',Email,1),LEN(Email)), Username