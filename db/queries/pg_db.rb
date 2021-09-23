require 'dotenv'
require 'pg'

class PGDatabase 

  Dotenv.load

  def self.make_connection(db)
    begin
      @db_session = PG.connect(dbname: db)
    rescue
      @db_session = PG.connect :dbname => db, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
    rescue PG::Error => e
      puts e.message 
    end 
  end

  def self.current_connection
    @db_session
  end

end