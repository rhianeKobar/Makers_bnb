-- Connect to each table one after eachother
-- use \c bnb
-- use \c bnb_test
TRUNCATE properties;

ALTER TABLE properties
ADD ID_USERS INT NOT NULL REFERENCES users(ID);