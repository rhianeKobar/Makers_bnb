
-- Create both tables
CREATE DATABASE bnb;
CREATE DATABASE bnb_test;

-- Connect to each table one after eachother
-- use \c bnb
-- use \c bnb_test
CREATE TABLE properties(id SERIAL PRIMARY KEY, name VARCHAR(60), description TEXT, price INTEGER, availability BOOLEAN);