SELECT JobDuringJourney, FullName, JobRank
	FROM(
		SELECT  tc.JobDuringJourney, CONCAT(c.FirstName, ' ', c.LastName) AS FullName, 
				ROW_NUMBER() OVER(PARTITION BY tc.JobDuringJourney ORDER BY c.BirthDate) AS JobRank
			FROM TravelCards AS tc
			JOIN Colonists AS c ON c.Id = tc.ColonistId
		)AS k
WHERE JobRank = 2