SELECT a.Id AS AccountId, a.Email, ac.Name AS City, COUNT(*) AS Trips
	FROM AccountsTrips AS at
	JOIN Accounts AS a ON a.Id = at.AccountId
	JOIN Cities AS ac ON ac.Id = a.CityId
	JOIN Trips AS t ON t.Id = at.TripId
	JOIN Rooms AS r ON r.Id = t.RoomId
	JOIN Hotels AS h ON h.Id = r.HotelId
	JOIN Cities AS hc ON hc.Id = h.CityId
	WHERE ac.Name = hc.Name
	GROUP BY a.Id , a.Email, ac.Name
ORDER BY Trips DESC, AccountId