-- from the terminal run:
-- psql -f medical_center.sql


DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO doctors 
    (first_name, last_name)
VALUES
    ('Albert', 'Simmons'),
    ('Amy', 'Walters'),
    ('Teddy', 'Rotten');


INSERT INTO patients 
    (first_name, last_name)
VALUES
    ('Patient', 'Zero'),
    ('Patient', 'One'),
    ('Patient', 'Two');


INSERT INTO diseases 
    (name)
VALUES
    ('Foot Fungus'),
    ('Brain Rot'),
    ('Stomach Worm');

INSERT INTO visits 
    (doctor_id, patient_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (2, 3),
    (2, 2),
    (3, 3);


INSERT INTO diagnosis
    (visit_id, disease_id)
VALUES
    (1, 3),
    (2, 2),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2);
 
