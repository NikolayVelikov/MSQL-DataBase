SELECT TOP(5) c.CountryName, r.RiverName
	FROM Countries AS c
	JOIN Continents AS con ON con.ContinentCode = c.ContinentCode
	LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
	LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
WHERE con.ContinentName = 'Africa'
ORDER BY c.CountryName