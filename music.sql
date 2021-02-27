-- from the terminal run:
-- psql < music.sql
-- psql -f music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
    id SERIAL PRIMARY KEY,
    name TEXT[] NOT NULL
 );

CREATE TABLE producers(
    id SERIAL PRIMARY KEY,
     name TEXT[] NOT NULL
 );

 CREATE TABLE albums(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    artist_id INTEGER REFERENCES artists ON DELETE CASCADE,
    producer_id INTEGER REFERENCES producers ON DELETE CASCADE
 
);

CREATE TABLE songs(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    release_date DATE NOT NULL,
    album_id INTEGER REFERENCES albums ON DELETE CASCADE

);


INSERT INTO artists
  (name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}');

INSERT INTO producers
  (name)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}');

INSERT INTO albums
  (title, artist_id, producer_id)
VALUES
  ('Middle of Nowhere', 1, 1),
  ('A Night at the Opera', 2, 2),
  ('Daydream', 3, 3);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3);

