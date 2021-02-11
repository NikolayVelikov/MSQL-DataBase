CREATE PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS

	DECLARE @HotelTripId INT = (SELECT r.HotelId FROM Trips AS t JOIN Rooms AS r ON r.Id = t.RoomId WHERE t.Id = @TripId)
	DECLARE @HotelTargetRoomId INT = (SELECT HotelId FROM Rooms WHERE Id = @TargetRoomId)
	
	IF(@HotelTripId != @HotelTargetRoomId)
		THROW 50001, 'Target room is in another hotel!', 1 	
	
	DECLARE @AccountsTripId INT = (SELECT COUNT(*) FROM AccountsTrips WHERE TripId = @TripId)	
	DECLARE @BedsTargetRoomId INT = (SELECT Beds FROM Rooms WHERE id = @TargetRoomId)
	
	IF( @AccountsTripId > @BedsTargetRoomId)
	THROW 50002, 'Not enough beds in target room!',1

	UPDATE Trips
	SET RoomId = @TargetRoomId
	WHERE Id = @TripId

EXEC dbo.usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE id = 10