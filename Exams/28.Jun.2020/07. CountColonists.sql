SELECT COUNT(*) AS count 
	FROM Journeys AS j
	JOIN TravelCards AS tc ON tc.JourneyId = j.Id
	JOIN Colonists AS c ON c.Id = tc.ColonistId
WHERE j.Purpose = 'technical'