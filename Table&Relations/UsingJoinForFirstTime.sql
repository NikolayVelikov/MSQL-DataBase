SELECT * FROM Towns
select * from Work
SELECT * FROM Students

SELECT FristName + ' ' + LastName AS [Name], t.Name AS [TownName],w.Name AS [WorkName]
FROM Students AS s
JOIN Towns AS t ON t.Id = s.TownId
JOIN Work AS w ON w.Id = s.WorkId