require 'pg'

def setup_test_database
  PGDatabase.truncate_tables
end
