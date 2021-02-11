CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT) 
RETURNS NVARCHAR(MAX)				
AS
BEGIN
	DECLARE @RoomId INT = (SELECT k.Id FROM(SELECT TOP(1) r.Id,r.Type,r.Beds,(h.BaseRate + r.Price) * 2 AS RoomPrice
		FROM Hotels AS h
		JOIN Rooms AS r ON r.HotelId = h.Id
		JOIN Trips AS t ON t.RoomId = r.Id
		WHERE h.Id = @HotelId AND NOT(@Date BETWEEN t.ArrivalDate AND t.ReturnDate) AND r.Beds >= @People
	ORDER BY RoomPrice DESC) AS k);

	DECLARE @RoomType NVARCHAR(20) = (SELECT k.Type FROM(SELECT TOP(1) r.Id,r.Type,r.Beds,(h.BaseRate + r.Price) * 2 AS RoomPrice
		FROM Hotels AS h
		JOIN Rooms AS r ON r.HotelId = h.Id
		JOIN Trips AS t ON t.RoomId = r.Id
		WHERE h.Id = @HotelId AND NOT(@Date BETWEEN t.ArrivalDate AND t.ReturnDate) AND r.Beds >= @People
	ORDER BY RoomPrice DESC) AS k);

	DECLARE @Beds INT = (SELECT k.Beds FROM(SELECT TOP(1) r.Id,r.Type,r.Beds,(h.BaseRate + r.Price) * 2 AS RoomPrice
		FROM Hotels AS h
		JOIN Rooms AS r ON r.HotelId = h.Id
		JOIN Trips AS t ON t.RoomId = r.Id
		WHERE h.Id = @HotelId AND NOT(@Date BETWEEN t.ArrivalDate AND t.ReturnDate) AND r.Beds >= @People
	ORDER BY RoomPrice DESC) AS k);

	DECLARE @Price DECIMAL(19,2) = (SELECT k.RoomPrice FROM(SELECT TOP(1) r.Id,r.Type,r.Beds,(h.BaseRate + r.Price) * 2 AS RoomPrice
		FROM Hotels AS h
		JOIN Rooms AS r ON r.HotelId = h.Id
		JOIN Trips AS t ON t.RoomId = r.Id
		WHERE h.Id = @HotelId AND NOT(@Date BETWEEN t.ArrivalDate AND t.ReturnDate) AND r.Beds >= @People
	ORDER BY RoomPrice DESC) AS k);

	DECLARE @Result NVARCHAR(MAX) = 'Room ' + CONVERT(NVARCHAR,@RoomId) + ': ' + CONVERT(NVARCHAR,@RoomType) 
												+ ' (' + CONVERT(NVARCHAR,@Beds)+' beds) - $' + CONVERT(NVARCHAR,@Price)
	IF(@Result IS NULL)
		RETURN 'No rooms available'	
		
	RETURN @Result
END
	-- • ('2011-12-17' BETWEEN t.ArrivalDate AND t.ReturnDate) -> The room must not be already occupied. A room is occupied if the date the customers want to book is between the arrival and return dates of a trip to that room and the trip is not canceled.
	-- • h.Id = 112 -> The room must be in the provided hotel.
	-- • r.Beds >= 2 ->	The room must have enough beds for all the people.

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)