-- psql -f craigslist.sql



DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES region ON DELETE CASCADE
);


CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region ON DELETE CASCADE,
    category_id INTEGER REFERENCES category ON DELETE CASCADE
);

INSERT INTO region
    (name)
VALUES
    ('New York'),
    ('Los Angeles'),
    ('Chicago'),
    ('San Francisco'),
    ('Seattle');

INSERT INTO users
    (name, preferred_region_id)
VALUES
    ('Fred', 1),
    ('Josh', 2),
    ('Dave', 3),
    ('Amy', 4),
    ('Sara', 5);

INSERT INTO category
    (category)
VALUES
    ('Auto'),
    ('Housing'),
    ('Jobs'),
    ('Discussion');

INSERT INTO post
    (title, content, user_id, region_id, category_id)
VALUES
    ('New House in Chicago', 'Big, Nice, Must See', 2, 3, 2),
    ('Awesome Car', 'Not old, Fast', 5, 5, 1),
    ('Software Developer Needed', 'Sorry no jr developers at this time.', 3, 4, 3);
 
