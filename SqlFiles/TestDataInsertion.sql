INSERT INTO Developers (DeveloperID, Name) VALUES 
(1, 'Nintendo EPD'),
(2, 'FromSoftware'),
(3, 'ConcernedApe'),
(4, 'Larian Studios');

INSERT INTO Players (PlayerID, Name, Age) VALUES 
(1, 'Alice', 24),
(2, 'Bob', 31),
(3, 'Charlie', 19),
(4, 'Diana', 27);

INSERT INTO Games (GameID, Name, DeveloperID, AverageScore) VALUES 
(1, 'The Legend of Zelda: Tears of the Kingdom', 1, 0),
(2, 'Elden Ring', 2, 0),
(3, 'Stardew Valley', 3, 0),
(4, 'Baldur''s Gate 3', 4, 0),
(5, 'Super Mario Odyssey', 1, 0);

INSERT INTO HasPlayed (PlayerID, GameID, Score, DateFinished) VALUES 
(1, 1, 10, '2023-06-15'),
(1, 3, 9, '2021-04-10'),
(1, 5, 8, '2019-12-25'),

(2, 2, 9, '2022-05-20'),
(2, 4, 10, '2023-11-05'),

(3, 1, 8, '2023-08-01'),
(3, 2, 10, '2023-01-14'),

(4, 3, 10, '2022-02-14'),
(4, 4, 9, '2024-01-10');