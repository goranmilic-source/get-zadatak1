CREATE TABLE people (
    id             SERIAL PRIMARY KEY,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    favorite_movie VARCHAR(100) NOT NULL
);

INSERT INTO people (first_name, last_name, favorite_movie) VALUES
    ('Goran',  'Milic',   'Gladiator'),
    ('Ana',    'Petrovic', 'Inception'),
    ('Marko',  'Jovanovic', 'The Matrix'),
    ('Jelena', 'Nikolic', 'Casablanca'),
    ('Stefan', 'Ilic',    'Interstellar');

SELECT * FROM people;