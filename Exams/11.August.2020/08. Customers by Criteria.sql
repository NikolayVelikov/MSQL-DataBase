SELECT FirstName, Age, PhoneNumber
	FROM Customers AS p
	JOIN Countries AS c ON c.Id = p.CountryId
	WHERE (Age >= 21 AND FirstName LIKE '%an%') OR (PhoneNumber LIKE '%38' AND NOT(c.Name = 'Greece'))
ORDER BY FirstName ASC, Age DESC