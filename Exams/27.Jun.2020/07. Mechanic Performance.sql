SELECT Mechanic,AVG(Days) AS [Average Days]
FROM(
	SELECT CONCAT(FirstName,' ', LastName) AS Mechanic, DATEDIFF(DAY,IssueDate,FinishDate) AS Days,m.MechanicId AS id
		FROM Mechanics AS m
		JOIN Jobs AS j ON j.MechanicId = m.MechanicId
		WHERE Status = 'Finished'
) AS k
GROUP BY Mechanic, id
ORDER BY id