
-- Create both tables
CREATE DATABASE bnb;

-- Connect to each table one after eachother
-- use \c bnb
CREATE TABLE properties(id SERIAL PRIMARY KEY, name VARCHAR(60), description TEXT, price INTEGER, availability BOOLEAN);

-- Connect to each table one after eachother
-- use \c bnb
CREATE TABLE  users (
  ID BIGSERIAL NOT NULL PRIMARY KEY,
  email varchar(100),
  password varchar(60)
);

-- Connect to each table one after eachother
-- use \c bnb
TRUNCATE properties, users;

ALTER TABLE properties
ADD ID_USERS INT NOT NULL REFERENCES users(ID);

-- Connect to each table one after eachother
-- use \c bnb
CREATE TABLE property_request
(id SERIAL PRIMARY KEY, 
id_properties INT NOT NULL REFERENCES properties(ID), 
id_user_requested INT NOT NULL REFERENCES users(ID), 
id_user_owner INT NOT NULL REFERENCES users(ID));

