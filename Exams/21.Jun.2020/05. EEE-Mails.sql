SELECT FirstName, LastName, CONVERT(VARCHAR,BirthDate,110),c.Name AS Hometown, Email
	FROM Accounts AS a
	JOIN Cities AS c ON c.Id = a.CityId
	WHERE Email LIKE 'e%'
ORDER BY Hometown ASC