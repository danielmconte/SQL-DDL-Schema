-- from the terminal run:
-- psql < air_traffic.sql
-- psql -f air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE passengers(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL
  
);

CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    country TEXT NOT NULL
);

CREATE TABLE airlines(
    id SERIAL PRIMARY KEY,
    airline TEXT NOT NULL
);

CREATE TABLE flights(
    id SERIAL PRIMARY KEY,
    departure_city_id INTEGER REFERENCES cities ON DELETE CASCADE,
    departure_country_id INTEGER REFERENCES countries ON DELETE CASCADE,
    arrival_city_id INTEGER REFERENCES cities ON DELETE CASCADE,
    arrival_country_id INTEGER REFERENCES countries ON DELETE CASCADE,
    airline_id INTEGER REFERENCES airlines ON DELETE CASCADE
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  flight_id INTEGER REFERENCES flights ON DELETE CASCADE
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley');

INSERT INTO cities
  (city)
VALUES
   ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas');

INSERT INTO countries
  (country)
VALUES  
  ('United States'),
  ('Japan'),
  ('United Kingdom');

INSERT INTO airlines
  (airline)
VALUES  
  ('United'),
  ('British Airways'),
  ('Delta');

INSERT INTO flights
  (departure_city_id, departure_country_id, arrival_city_id, arrival_country_id, airline_id)
VALUES  
  (1, 1, 2, 1, 1),
  (3, 2, 4,3, 2),
  (5, 1, 6, 1, 3);

INSERT INTO tickets
  (seat, departure, arrival, passenger_id, flight_id)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3);


