DELETE FROM RepositoriesContributors WHERE RepositoryId = 3
DELETE FROM Issues WHERE RepositoryId = 3

SELECT * FROM Repositories WHERE Name = 'Softuni-Teamwork'