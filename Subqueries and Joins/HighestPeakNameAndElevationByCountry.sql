SELECT TOP(5) a.CountryName, a.PeakName, a.HighestPeak, a.MountainRange
FROM (SELECT CountryName, 
	   ISNULL(p.PeakName,'(no highest peak)') AS PeakName,
	   ISNULL(m.MountainRange,'(no mountain)') AS MountainRange,
	   ISNULL(MAX(p.Elevation),0) AS HighestPeak,
	   DENSE_RANK() OVER (PARTITION BY  CountryName ORDER BY MAX(p.Elevation) DESC) AS Ranked
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
LEFT JOIN Peaks AS p ON p.MountainId = m.Id
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id  = cr.RiverId
GROUP BY CountryName, p.PeakName, m.MountainRange) AS a
WHERE Ranked = 1
ORDER BY CountryName, PeakName