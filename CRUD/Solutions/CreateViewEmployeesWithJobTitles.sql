CREATE VIEW V_EmployeeNameJobTitle AS
SELECT CONCAT(FirstName,' ',ISNULL(MiddleName,''),' ',LastName) as [Full Name], JobTitle as [Job Title]
FROM Employees
