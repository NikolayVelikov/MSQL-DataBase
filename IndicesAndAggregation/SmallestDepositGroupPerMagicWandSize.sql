SELECT TOP(2) DepositGroup
FROM(
	SELECT DepositGroup, AVG(MagicWandSize) AS Wand
	FROM WizzardDeposits
	GROUP BY DepositGroup
	) AS a
ORDER BY Wand
