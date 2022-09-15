/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS WHERE NAME LIKE '%mon';
SELECT NAME FROM ANIMALS WHERE date_of_birth  BETWEEN '2016-01-01' AND '2019-12-31';
SELECT NAME FROM ANIMALS WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM ANIMALS WHERE NAME = 'Agumon' OR  NAME = 'Pikachu';
SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT > 10.5;
SELECT NAME FROM ANIMALS WHERE NEUTERED = TRUE;
SELECT NAME FROM ANIMALS WHERE NAME != 'Gabumon';
SELECT NAME FROM ANIMALS WHERE WEIGHT >= 10.4 AND WEIGHT <= 17.3;

BEGIN;
UPDATE ANIMALS SET SPICIES = 'unspecified';
SELECT * FROM ANIMALS;
ROLLBACK;
SELECT * FROM ANIMALS;

BEGIN;
UPDATE ANIMALS SET SPECIES = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM ANIMALS;
UPDATE ANIMALS SET SPECIES = 'pokemon' WHERE SPECIES = '';
SELECT * FROM ANIMALS;
COMMIT;

BEGIN;
DELETE FROM ANIMALS;
SELECT * FROM ANIMALS;
ROLLBACK;

BEGIN:
DELETE FROM ANIMALS WHERE DATE_OF_BIRTH > '2022-01-01';
SELECT * FROM ANIMALS;
SAVEPOINT SP1;
UPDATE ANIMALS SET WEIGHT = WEIGHT*-1;
SELECT * FROM ANIMALS;
ROLLBACK TO SP1;
UPDATE ANIMALS SET WEIGHT = WEIGHT*-1 WHERE WEIGHT < 0;
SELECT * FROM ANIMALS;
COMMIT;

SELECT COUNT(NAME) FROM ANIMALS;
SELECT COUNT(NAME) FROM ANIMALS WHERE escape_attempts = 0;
SELECT AVG(WEIGHT) FROM ANIMALS;
SELECT NEUTERED, SUM(ESCAPE_ATTEMPTS) FROM ANIMALS GROUP BY NEUTERED;
SELECT NEUTERED, MAX(WEIGHT), MIN(WEIGHT) FROM ANIMALS GROUP BY NEUTERED;
SELECT AVG(ESCAPE_ATTEMPTS), NEUTERED FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY NEUTERED;

/* WEDNESDAY */

