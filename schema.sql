/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS (
    ID INT GENERATED BY DEFAULT AS IDENTITY, 
    NAME VARCHAR(20) NOT NULL, 
    DATE_OF_BIRTH DATE, 
    ESCAPE_ATTEMPTS INT DEFAULT 0 NOT NULL, 
    NEUTERED BOOLEAN DEFAULT FALSE NOT NULL, 
    WEIGHT DECIMAL NOT NULL
);

ALTER TABLE ANIMALS ADD SPICIES VARCHAR(40);
