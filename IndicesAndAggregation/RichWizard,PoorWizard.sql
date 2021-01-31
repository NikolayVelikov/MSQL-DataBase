SELECT SUM(Difference) AS SumDifference
FROM(
	SELECT h.FirstName AS [Host Wizard], h.DepositAmount AS [Host Wizard Deposit],g.FirstName AS [Guest Wizard], g.DepositAmount AS [Guest Wizard Deposit], h.DepositAmount - g.DepositAmount AS [Difference]
	From WizzardDeposits AS g
	JOIN WizzardDeposits AS h ON h.Id = g.Id-1) AS wizzard