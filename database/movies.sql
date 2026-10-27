CREATE TABLE IF NOT EXISTS movies (
    id             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    favorite_movie VARCHAR(100) NOT NULL
);

INSERT INTO movies (first_name, last_name, favorite_movie) VALUES
('Ana',       'Jovanovic',   'The Matrix'),
('Marko',     'Nikolic',     'Inception'),
('Sara',      'Kovac',       'The Godfather'),
('Luka',      'Horvat',      'Gladiator'),
('Mia',       'Popovic',     'Spirited Away'),
('Nikola',    'Stanic',      'Blade Runner'),
('Elena',     'Markovic',    'Amelie'),
('Stefan',    'Ilic',        'Pulp Fiction'),
('Jelena',    'Pavlovic',    'The Shawshank Redemption'),
('Milan',     'Todorovic',   'Interstellar'),
('Ivana',     'Radic',       'Parasite'),
('Petar',     'Savic',       'Fight Club'),
('Katarina',  'Bogdanovic',  'Casablanca');


