require_relative 'pg_db.rb'

p "move your dotenv load here if all else works (pg_connect.rb)"

module DB 

  def connect

    if ENV['ENVIRONMENT'] == 'test'
      PGDatabase.make_connection('bnb_test')
    else
      PGDatabase.make_connection('bnb')
    end

  end

end
