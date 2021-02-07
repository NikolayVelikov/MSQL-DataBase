	SELECT  p.PartId, 
			p.Description, 
			pn.Quantity AS Reqiared, 
			p.StockQty AS InStock,
			IIF(o.Delivered = 0,op.Quantity,0) AS Ordered
		FROM Parts AS p
	LEFT JOIN PartsNeeded AS pn ON p.PartId = pn.PartId
	LEFT JOIN OrderParts AS op ON op.PartId = p.PartId
	LEFT JOIN Jobs AS j ON j.JobId = pn.JobId
	LEFT JOIN Orders AS o ON o.JobId = j.JobId
	WHERE j.Status <> 'Finished' AND p.StockQty + IIF(o.Delivered = 0,op.Quantity,0) < pn.Quantity
ORDER BY p.PartId