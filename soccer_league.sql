-- psql -f soccer_league.sql


DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL 
);

CREATE TABLE team(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES team ON DELETE CASCADE
);

CREATE TABLE referee(
    id SERIAL PRIMARY KEY,
    nickname TEXT NOT NULL
); 

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES team ON DELETE CASCADE,
    away_team_id INTEGER REFERENCES team ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referee ON DELETE SET NULL,
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    winner_id INTEGER REFERENCES team ON DELETE CASCADE
);


CREATE TABLE goals(
    game_id INTEGER REFERENCES games ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE
    
);



INSERT INTO season
    (start_date, end_date)
VALUES
    ('2018-03-01', '2018-06-30'),
    ('2019-03-01', '2019-06-30');

INSERT INTO team
    (name)
VALUES
    ('Simple Devils'),
    ('Dapper Devils'),
    ('Coy Devils'),
    ('Slick Devils');
  

INSERT INTO players
    (first_name, last_name, team_id)
VALUES
    ('Jack', 'Wallace', 1),
    ('Ollie', 'Lopez', 1),
    ('Sumin', 'Kim', 2),
    ('Franz', 'Kafka', 2),
    ('Albert', 'Einstein', 3),
    ('Will', 'Chamberlain', 3),
    ('Max', 'Apple', 4),
    ('Seed', 'Four', 4);

INSERT INTO referee
    (nickname)
VALUES
    ('The Whistle'),
    ('The Hammer');    

INSERT INTO games
    (home_team_id, away_team_id, referee_id, season_id, winner_id)
VALUES
-- Season One Games
    (1, 3, 2, 1, null),
    (1, 4, 2, 1, 4),
    (2, 4, 1, 1, 2),
    (2, 3, 1, 1, null),

-- Season Two Games
    (1, 3, 2, 2, 1),
    (1, 4, 2, 2, 4),
    (2, 4, 1, 2, 4),
    (2, 3, 1, 2, 3);



INSERT INTO goals
    (game_id, player_id)
VALUES
    (1, 1),  --Coy Devils 1, Simple Devils 1
    (1, 5),
    (2, 7),  --Slick Devils 1, Simple Devils 0
    (3, 3),  --Slick Devils 0, Dapper Devils 1
    (4, 3),  --Coy Devils 1, Dapper Devils 1
    (4, 6),
    (5, 2),  --Coy Devils 0, Simple Devils 2 
    (5, 2),
    (6, 8),  --Slick Devils 1, Simple Devils 0 
    (7, 8),  --Slick Devils 1, Dapper Devils 0 
    (8, 4);  --Coy Devils 1, Dapper Devils 0 

