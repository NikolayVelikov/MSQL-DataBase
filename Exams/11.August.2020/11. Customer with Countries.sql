CREATE VIEW v_UserWithCountries AS
SELECT CONCAT(p.FirstName,' ',p.LastName) AS CustomerName, p.Age, p.Gender,c.Name AS CountryName
	FROM Customers AS p
	JOIN Countries AS c ON c.Id = p.CountryId

SELECT TOP(5) *
	FROM v_UserWithCountries
ORDER BY Age