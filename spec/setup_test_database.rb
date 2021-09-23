require 'pg'

def setup_test_database
  # connection = PG.connect(dbname: 'bnb_test')
  PGDatabase.truncate_tables
  # connection.exec("TRUNCATE properties;")
end
