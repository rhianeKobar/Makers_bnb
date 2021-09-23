-- Connect to each table one after eachother
-- use \c bnb
-- use \c bnb_test
CREATE TABLE  users (
  ID BIGSERIAL NOT NULL PRIMARY KEY,
  email varchar(100),
  password varchar(60)
);