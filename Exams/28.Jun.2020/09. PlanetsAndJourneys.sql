SELECT k.Name AS PlanetName, MAX(k.Rank) AS JourneysCount
FROM(
	SELECT p.Name, ROW_NUMBER() OVER (PARTITION BY p.Name ORDER BY p.Name) AS Rank
		FROM Journeys AS j
		JOIN Spaceports AS s ON s.Id = j.DestinationSpaceportId
		JOIN Planets AS p ON p.Id = s.PlanetId
) AS k
GROUP BY k.Name
ORDER BY JourneysCount DESC, k.Name