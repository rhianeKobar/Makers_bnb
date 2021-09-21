require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bnb')
  connection.exec("TRUNCATE properties;")
end
