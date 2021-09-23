require 'pg'

def setup_test_database
  connection = PG.connect('localhost','5432','','','bnb_test','postgres','postgres')
  connection.exec("TRUNCATE properties;")
end
