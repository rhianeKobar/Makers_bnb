
require 'pg'

class PGDatabase 

  def self.make_connection(db)
    begin
      @db_session = PG.connect(dbname: db)
    rescue
      @db_session = PG.connect('localhost','5432','','',db,'postgres',ENV['DBPASSWORD'])
    rescue
      p 'it didnt work'
      @db_session = PG.connect :dbname => db, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
    rescue PG::Error => e
      puts e.message 
    end 
  end
  
  def self.insert_user
    @db_session.exec("query here...")
  end

  def self.current_connection
    @db_session
  end

  def self.truncate_tables
    @db_session.exec("TRUNCATE properties, users, property_request;")
  end

  # Select
  
  def self.select_properties
    @db_session.exec("SELECT * FROM properties;")
  end

  def self.select_property(id:)
    @db_session.query("SELECT * FROM properties WHERE id = #{id};")
  end

  def self.select_user(id:)
    @db_session.exec_params("SELECT * FROM users WHERE id = $1;", [id]).first
  end

  def self.select_user_email(email: )
   @db_session.exec_params("SELECT * FROM users WHERE email = $1;", [email]).first
  end

  # Insert

  def self.insert_property(name:, description:, price:, availability:, user_id: )
    @db_session.exec_params("INSERT INTO properties (name, description, price, availability, ID_USERS) VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price, availability;", [name,description,price,availability, user_id])
  end

  def self.add_new_user( email: , password: )
    @db_session.exec_params("INSERT INTO users (email, password) VALUES ($1,$2) RETURNING *;", [email , password]).first
  end

end