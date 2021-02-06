CREATE PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(50))
AS
	DECLARE @CurrentId INT = (Select TOP(1) Id FROM Journeys WHERE Id = @JourneyId);
	DECLARE @CurrentPurpose VARCHAR(50) = (Select TOP(1) Purpose FROM Journeys WHERE Id = @JourneyId);

	IF(@CurrentId IS NULL)
		BEGIN
			THROW 50001, 'The journey does not exist!', 1;
		END 
	IF(@CurrentPurpose = @NewPurpose)
		BEGIN
			THROW 50002, 'You cannot change the purpose!', 1;
		END
	UPDATE Journeys
	SET Purpose = @NewPurpose
	WHERE Id = @JourneyId

EXEC dbo.usp_ChangeJourneyPurpose 4, 'Technical'
EXEC dbo.usp_ChangeJourneyPurpose 2, 'Educational'
EXEC dbo.usp_ChangeJourneyPurpose 196, 'Technical'