-- Connect to each table one after eachother
-- use \c bnb
-- use \c bnb_test
CREATE TABLE property_request
(id SERIAL PRIMARY KEY, 
id_properties INT NOT NULL REFERENCES properties(ID), 
id_user_requested INT NOT NULL REFERENCES users(ID), 
id_user_owner INT NOT NULL REFERENCES users(ID));