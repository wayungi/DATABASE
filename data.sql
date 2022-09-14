/* Populate database with sample data. */

INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT) 
VALUES ('Agumon', '2020-02-03', 0, FALSE, 10.23);
INSERT INTO ANIMALS (NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT) VALUES 
('Gabumon', '2018-11-15', 2, TRUE, 8.00), 
('Pikachu', '2021-01-07', 1, FALSE, 15.04), 
('Devimon', '2017-05-12', 5, TRUE, 11.00);


INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight, spicies)
VALUES ('Charmander', '2020-02-08',0, TRUE, 11.00, NULL),  
(' Plantmon', '2021-11-05',2, TRUE, 5.70, NULL),
('Squirtle', '1993-04-02',3, FALSE, 12.13, NULL),
('Angemon', '2005-06-07',1, TRUE, 45.00, NULL),
('Boarmon', '2005-06-07',7, TRUE, 20.40, NULL),
('Blossom', '1998-10-13',3, TRUE, 17.00, NULL),
('Ditto', '2022-05-14',4, TRUE, 22.00, NULL);