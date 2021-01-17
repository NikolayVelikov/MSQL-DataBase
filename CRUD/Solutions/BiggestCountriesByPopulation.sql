SELECT TOP(30) CountryName,Population
FROM Countries
WHERE ContinentCode = 'eu'
ORDER BY Population DESC