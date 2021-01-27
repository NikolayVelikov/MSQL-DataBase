SELECT mc.CountryCode, COUNT(mc.CountryCode) AS MountainRanges
FROM Countries AS c
JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
JOIN Mountains AS m ON m.Id = mc.MountainId
WHERE c.IsoCode IN ('RUS','USA','BGR')
GROUP BY mc.CountryCode 