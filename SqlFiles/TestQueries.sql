USE GameTracker;

SELECT
    Players.Name AS PlayerName, 
    Games.Name AS GameName
FROM Players
INNER JOIN HasPlayed ON Players.PlayerID = HasPlayed.PlayerID
INNER JOIN Games ON HasPlayed.GameID = Games.GameID;

SELECT Games.AverageScore FROM Games;

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