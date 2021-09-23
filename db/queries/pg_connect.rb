require_relative 'pg_db.rb'
require 'dotenv'

module DB 

  def self.connect

    Dotenv.load

    if ENV['ENVIRONMENT'] == 'test'
      PGDatabase.make_connection('bnb_test')
    else
      PGDatabase.make_connection('bnb')
    end

  end

end
