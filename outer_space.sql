-- from the terminal run:
-- psql < outer_space.sql
-- psql -f outer_space.sql


DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  );

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies ON DELETE CASCADE
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE
);



INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1);

INSERT INTO moons
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2);


 



