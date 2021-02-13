SELECT f.Id, f.Name, CONVERT(VARCHAR,f.Size) + 'KB' AS Size
	FROM Files AS f
	LEFT JOIN Files AS pf ON pf.ParentId = f.Id
	WHERE pf.Id IS NULL
ORDER BY Id ASC, Name ASC, Size DESC