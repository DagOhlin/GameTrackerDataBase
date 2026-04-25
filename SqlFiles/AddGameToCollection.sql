USE GameTracker;

DROP PROCEDURE IF EXISTS AddGameToCollection;

DELIMITER %%

CREATE PROCEDURE AddGameToCollection(IN game_name VARCHAR(255), IN player_ID INT UNSIGNED, IN score INT, OUT return_val INT, OUT return_message VARCHAR(255))
BEGIN 

DECLARE v_game_ID INT UNSIGNED;
DECLARE game_amount INT;
DECLARE already_played INT;

SELECT COUNT(*) INTO game_amount FROM Games WHERE Name = game_name;

IF game_amount = 0 THEN
	SET return_message = concat('Game ', game_name, ' does not exist');
    SET return_val = 1;
    
ELSEIF game_amount > 1 THEN
	SET return_message = concat('there are more than one game with name ', game_name, ' use ID instead');
    SET return_val = 2;
    
ELSE
	SELECT GameID INTO v_game_ID FROM Games WHERE Name = game_name;
    
    SELECT COUNT(*) INTO already_played FROM HasPlayed WHERE PlayerID = player_ID AND GameID = v_game_ID;
    
    IF already_played > 0 THEN
		SET return_message = concat('you have already added ', game_name, ' to your colection.');
		SET return_val = 3;
    ELSE
		INSERT INTO HasPlayed (GameID, PlayerID, Score) VALUES (v_game_ID, player_ID, score);
		SET return_message = concat('Game ', game_name, ' added to collection with score ', score);
		SET return_val = 0;
    END IF;
    
END IF;
END %%

DELIMITER ;