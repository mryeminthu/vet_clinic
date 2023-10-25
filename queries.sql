/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SElECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name='Agumon' OR  name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE NOT name='Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

 BEGIN TRANSACTION;
 UPDATE animals SET species = 'unspecified';
 ROLLBACK;

 BEGIN TRANSACTION;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
 SELECT * from animals;
 COMMIT;
 SELECT * from animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to sp;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) as "Maximun Escape Attempts"
FROM animals
GROUP BY neutered
ORDER BY "Maximun Escape Attempts" DESC
LIMIT 1;
SELECT species, MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS "Average Escape Attempts"
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;

SELECT animals.name
FROM animals
JOIN owners 
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name AS Animal, species.name AS Type
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT name, full_name
FROM animals
FULL JOIN owners
ON animals.owner_id = owners.id;

SELECT species.name, COUNT(animals.id) AS "Count Animals"
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name
ORDER BY "Count Animals" DESC;

SELECT animals.name AS "Animal", species.name AS "Type", owners.full_name AS owner
FROM species
JOIN animals ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND  owners.full_name = 'Dean Winchester';

SELECT COUNT(animals.owner_id) AS "Count Animals", owners.full_name
FROM animals JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY "Count Animals" DESC
LIMIT 1;

SELECT v.name AS vet_name, a.name AS animal_name
FROM visits AS vi
JOIN vets AS v ON vi.vets_name = v.name
JOIN animals AS a ON vi.animal_name = a.name
WHERE v.name = 'William Tatcher'
ORDER BY vi.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT vi.animal_name) AS animals_seen
FROM visits AS vi
WHERE vi.vets_name = 'Stephanie Mendez';

SELECT v.name AS vet_name, s.species_name AS specialty
FROM vets AS v
LEFT JOIN specializations AS s ON v.id = s.vet_id;

SELECT a.name AS animal_name, vi.visit_date
FROM visits AS vi
JOIN vets AS v ON vi.vets_name = v.name
JOIN animals AS a ON vi.animal_name = a.name
WHERE v.name = 'Stephanie Mendez'
AND vi.visit_date >= '2020-04-01'
AND vi.visit_date <= '2020-08-30';

SELECT animal_name, COUNT(*) AS num_visits
FROM visits
GROUP BY animal_name
ORDER BY num_visits DESC
LIMIT 1;

SELECT vi.animal_name, vi.visit_date
FROM visits AS vi
JOIN vets AS v ON vi.vets_name = v.name
WHERE v.name = 'Maisy Smith'
ORDER BY vi.visit_date ASC
LIMIT 1;

SELECT vi.animal_name, vi.vets_name AS vet_name, vi.visit_date
FROM visits AS vi
ORDER BY vi.visit_date DESC
LIMIT 1;