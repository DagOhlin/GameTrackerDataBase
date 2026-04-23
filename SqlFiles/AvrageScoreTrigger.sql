USE GameTracker;

DROP TRIGGER IF EXISTS AverageScoreTrigger;

DELIMITER %%

CREATE TRIGGER AverageScoreTrigger
AFTER INSERT
ON HasPlayed FOR EACH ROW
BEGIN
UPDATE Games
SET Games.AverageScore = (SELECT AVG(HasPlayed.Score) FROM HasPlayed WHERE HasPlayed.GameID = NEW.GameID) WHERE Games.GameID = NEW.GameID;

END %% 

DELIMITER ;