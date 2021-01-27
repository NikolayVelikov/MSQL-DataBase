SELECT ContinentCode, CurrencyCode, Total AS CurrencyUsage
FROM (SELECT  ContinentCode,CurrencyCode, COUNT(CurrencyCode) AS Total,
		DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS Rank
FROM Countries
GROUP BY ContinentCode,CurrencyCode) AS a
WHERE Rank = 1 AND Total > 1
ORDER BY ContinentCode