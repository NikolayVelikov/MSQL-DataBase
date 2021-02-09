SELECT k.CountryName, k.DistributorName
	FROM(
		SELECT c.Name AS CountryName, d.Name AS DistributorName,
		DENSE_RANK() OVER(Partition by c.Name ORDER BY Count(i.Id) DESC) AS [Rank]
		FROM Countries AS c
		JOIN Distributors AS d ON d.CountryId = c.Id
		LEFT JOIN Ingredients AS i ON i.DistributorId = d.Id
		GROUP BY c.Name, d.Name
	) AS k
	WHERE k.Rank = 1
ORDER BY CountryName, DistributorName