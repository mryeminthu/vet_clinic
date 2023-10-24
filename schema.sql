/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg  NUMERIC(5,2)
);

ALTER TABLE animals ADD species VARCHAR(200);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR (100)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
  age INTEGER,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    vet_name varchar(300),
    species_name varchar(200),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
   animal_id INT,
   vet_id INT,
   visit_date DATE,
   PRIMARY KEY (animal_id, vet_id, visit_date),
   FOREIGN KEY (animal_id) REFERENCES animals (id),
   FOREIGN KEY (vet_id) REFERENCES vets (id)
);

