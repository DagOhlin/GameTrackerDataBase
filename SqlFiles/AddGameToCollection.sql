USE GameTracker;

DROP PROCEDURE IF EXISTS AddGameToCollection;

DELIMITER %%

CREATE PROCEDURE AddGameToCollection(IN game_name VARCHAR(255), IN player_ID INT UNSIGNED, IN score INT, OUT return_val INT, OUT return_message VARCHAR(255))
BEGIN 

DECLARE game_ID INT UNSIGNED;
DECLARE game_amount INT;

SELECT COUNT(*) INTO game_amount FROM Games WHERE game_name = Games.Name;

IF game_amount > 1 THEN
	SET return_message = concat('there are more than one game with name ', game_name, ' use ID instead');
    SET return_val = 2;


ELSEIF game_amount = 0 THEN
	SET return_message = concat('Game ', game_name, ' does not exist');
    SET return_val = 1;
ELSE
	SELECT GameID INTO game_ID FROM Games WHERE game_name = Games.Name;
	INSERT INTO HasPlayed (GameID, PlayerID, Score) VALUES (game_ID, player_ID, score);
    SET return_message = concat('Game ', game_name, ' added to colection with score ', score);
    SET return_val = 0;
END IF;
END %%

DELIMITER ;


