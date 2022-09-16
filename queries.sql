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

-- What animals belong to Melody Pond?
SELECT owners.id, full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals RIGHT JOIN species ON animals.species_id =species.id  WHERE species.name = 'Pokemon'; 

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, count(species.name) FROM species LEFT JOIN animals ON species.id = animals.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM  owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE animals.species_id = 2 AND animals.owner_id = 2; 

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name, animals.name, animals.escape_attempts FROM owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY count DESC;

/* THURSDAY */

-- Who was the last animal seen by William Tatcher?
SELECT vets.name, vets.id, visits.animals_id,visits.vets_id, visits.date_of_visit, animals.name FROM vets INNER JOIN visits ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.id = 1 ORDER BY visits.date_of_visit DESC LIMIT 1; 
    
-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(animals.name) FROM vets INNER JOIN visits ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id WHERE vets.id = 3 GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.species_id ;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM vets LEFT JOIN visits ON vets.id = visits.vets_id LEFT JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
    
-- What animal has the most visits to vets?
SELECT count(vets.name) AS visit_count, animals.name FROM vets LEFT JOIN visits ON vets.id = visits.vets_id LEFT JOIN animals ON visits.animals_id = animals.id GROUP BY animals.name ORDER BY visit_count DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT visits.date_of_visit, animals.name FROM vets LEFT JOIN visits ON vets.id = visits.vets_id INNER JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith'ORDER BY visits.date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight, visits.date_of_visit, vets.name, vets.age, vets.date_of_graduation FROM animals RIGHT JOIN visits ON visits.animals_id = animals.id LEFT JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;
    
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits LEFT JOIN vets ON vets.id = visits.vets_id LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON specializations.species_id = species.id WHERE vets.name = 'Maisy Smith';
    
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(*), species.name FROM vets RIGHT JOIN visits ON vets.id = visits.vets_id LEFT JOIN animals ON animals.id = visits.animals_id LEFT JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name;





