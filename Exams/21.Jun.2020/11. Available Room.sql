CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT) 
RETURNS NVARCHAR(MAX)				-- 112		  '2011-12-17'		2
AS
BEGIN

	DECLARE @HotelBaseRate DECIMAL(19,2) = (SELECT BaseRate FROM Hotels WHERE Id = 112);
	DECLARE @RoomPrice DECIMAL (19,2) = (SELECT r.Price FROM Rooms AS r JOIN Hotels AS h ON h.Id = r.HotelId WHERE h.Id = 112);
	DECLARE @Price DECIMAL(15,2) = (@HotelBaseRate + @RoomPrice) * 2;
	
	SELECT *
		FROM Hotels AS h
		JOIN Rooms AS r ON r.HotelId = h.Id
		JOIN Trips AS t ON t.RoomId = r.Id
		WHERE h.Id = 112 AND NOT('2011-12-17' BETWEEN t.ArrivalDate AND t.ReturnDate) AND r.Beds >= 2

	-- • ('2011-12-17' BETWEEN t.ArrivalDate AND t.ReturnDate) -> The room must not be already occupied. A room is occupied if the date the customers want to book is between the arrival and return dates of a trip to that room and the trip is not canceled.
	-- • h.Id = 112 -> The room must be in the provided hotel.
	-- • r.Beds >= 2 ->	The room must have enough beds for all the people.

END