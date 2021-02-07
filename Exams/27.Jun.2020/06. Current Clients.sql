--Select the names of all clients with active jobs (not Finished). Include the status of the job and how many days it’s been since it was submitted. Assume the current date is 24 April 2017. Order results by time length (descending) and by client ID (ascending).
SELECT CONCAT(c.FirstName,' ', c.LastName) AS Client,DATEDIFF(Day,IssueDate,'2017-04-24') AS [Days going], Status
	FROM Clients AS c
	JOIN Jobs AS j ON j.ClientId = c.ClientId
	WHERE NOT(j.Status = 'Finished')
ORDER BY [Days going] DESC, c.ClientId