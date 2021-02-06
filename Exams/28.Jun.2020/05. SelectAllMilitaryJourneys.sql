Select  Id,
		CONVERT(CHAR, JourneyStart, 103) AS JourneyStart,
		CONVERT(CHAR, JourneyEnd, 103) AS JourneyEnd
	FROM Journeys 
	WHERE Purpose = 'Military'
	ORDER BY JourneyStart