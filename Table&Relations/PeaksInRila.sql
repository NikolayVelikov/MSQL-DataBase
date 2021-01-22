--SELECT * FROM Peaks
--WHERE PeakName = 'Musala';

--SELECT * FROM Mountains
--WHERE MountainRange = 'Rila';

SELECT M.MountainRange AS MountainRange, P.PeakName AS PeakName, P.Elevation AS Elevation
FROM Mountains AS M
JOIN Peaks AS P ON
P.MountainId = M.Id
WHERE M.MountainRange = 'Rila'
ORDER BY P.Elevation DESC