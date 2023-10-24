/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES
 ('Agumon', '2020-2-3', 10.23, TRUE, 0),
 ('Gabumon', '2018-11-15', 8, TRUE, 2),
 ('Pikachu', '2021-1-7', 15.04, FALSE, 1),
 ('Devimon', '2017-5-12', 11, TRUE, 5);

 insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values
('Charmander', '2020-02-08', 0, FALSE, -11),
('Plantmon', '2021-11-15', 2, TRUE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boarmon', '2005-06-07', 7, TRUE, 20.4),
('Blossom', '1998-10-13', 3, TRUE, 17),
('Ditto', '2022-05-14', 4, TRUE, 22);

 insert into owners(full_name,age) values
 ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

insert into species (name) values
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon' AND species.name != 'Pokemon';

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name NOT LIKE '%mon' AND species.name != 'Digimon';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

  INSERT INTO specializations (vet_id, species_id, vet_name, species_name)
VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), 1, 'William Tatcher', 'Pokemon'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 1, 'Stephanie Mendez', 'Pokemon'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 2, 'Stephanie Mendez', 'Digimon'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 2, 'Jack Harkness', 'Digimon');

