SELECT  t.Id,
		CONCAT(a.FirstName,' ',ISNULL(a.MiddleName + ' ',''),a.LastName) AS [Full Name],
		ac.Name AS [From],		
		tc.Name AS [To],
		CASE
		WHEN t.CancelDate IS NULL THEN CONVERT(VARCHAR,DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) + ' days'
		ELSE 'Canceled'
		END AS Duration
	FROM AccountsTrips AS at
	JOIN Accounts AS a ON a.Id = at.AccountId
	JOIN Cities AS ac ON ac.Id = a.CityId
	JOIN Trips AS t ON t.Id = at.TripId
	JOIN Rooms AS r ON r.Id = t.RoomId
	JOIN Hotels AS h ON h.Id = r.HotelId
	JOIN Cities AS tc ON tc.Id = h.CityId
ORDER BY [Full Name], t.Id