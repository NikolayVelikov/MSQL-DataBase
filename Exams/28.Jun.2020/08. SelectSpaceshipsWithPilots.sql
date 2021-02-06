SELECT s.Name AS Name, s.Manufacturer AS Manufacturer
	FROM Journeys AS j
	JOIN TravelCards AS tc ON tc.JourneyId = j.Id
	JOIN Colonists AS c ON c.Id = tc.ColonistId
	JOIN Spaceships AS s ON s.Id = j.SpaceshipId
WHERE DATEDIFF(year,c.BirthDate,'2019-01-01') <= 30 AND tc.JobDuringJourney = 'Pilot'
ORDER BY s.Name