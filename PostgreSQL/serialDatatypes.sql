DROP TABLE IF EXISTS exes;

CREATE TABLE exes (
exid SERIAL,
name varchar(255)
);
INSERT INTO exes (name) VALUES ('Carrie') RETURNING exid

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
petid SERIAL,
name varchar(255)
);

INSERT INTO pets (name) VALUES ('Fluffy') RETURNING petid;
