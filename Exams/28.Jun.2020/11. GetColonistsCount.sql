CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30))
RETURNS INT
AS
BEGIN
	DECLARE @Value INT = (SELECT COUNT(*) AS Count
								FROM Journeys AS j
								JOIN TravelCards AS tc ON tc.JourneyId = j.Id
								JOIN Colonists AS c ON c.Id = tc.ColonistId
								JOIN Spaceports AS s ON s.Id = j.DestinationSpaceportId
								JOIN Planets AS p ON p.Id = s.PlanetId
							WHERE p.Name = @PlanetName);
	RETURN @Value;
END