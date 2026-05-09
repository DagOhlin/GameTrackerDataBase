USE GameTracker;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE HasPlayed;
TRUNCATE TABLE Games;
TRUNCATE TABLE Players;
TRUNCATE TABLE Developers;
-- should be fine to just enable forigen key check like this
SET FOREIGN_KEY_CHECKS = 1;