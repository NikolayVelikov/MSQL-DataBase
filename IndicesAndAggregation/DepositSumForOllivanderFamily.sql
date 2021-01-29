SELECT DepositGroup, SUM(DepositAmount) AS TotalSUm
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup