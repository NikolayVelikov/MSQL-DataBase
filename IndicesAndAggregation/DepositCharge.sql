SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS MinDepositcharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup