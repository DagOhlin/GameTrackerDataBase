USE GameTracker;

SELECT
    Players.Name AS PlayerName, 
    Games.Name AS GameName
FROM Players
INNER JOIN HasPlayed ON Players.PlayerID = HasPlayed.PlayerID
INNER JOIN Games ON HasPlayed.GameID = Games.GameID;

SELECT Games.AverageScore FROM Games;

DELETE FROM Developers WHERE DeveloperID = 6;

SELECT Games.Name FROM HasPlayed INNER JOIN Games ON HasPlayed.GameID = Games.GameID WHERE HasPlayed.PlayerID = '1';

SELECT 
    Players.Name AS Player,
    Games.Name AS Game,
    Developers.Name AS Developer,
    HasPlayed.Score,
    HasPlayed.DateFinished
FROM HasPlayed
JOIN Players ON HasPlayed.PlayerID = Players.PlayerID
JOIN Games ON HasPlayed.GameID = Games.GameID
JOIN Developers ON Games.DeveloperID = Developers.DeveloperID;