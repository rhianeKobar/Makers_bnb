require 'bcrypt'
require 'dotenv'

class User

  Dotenv.load

  def self.add_new_user(email:, password:)
    result = PGDatabase.add_new_user(email: email, password: encrypt(password))
    User.new(id: result['id'], email: result['email'])
  end

  def self.find_user(id: )
    return nil unless id
    result = PGDatabase.select_user(id: id)
    User.new(id: result['id'], email:result['email'])
  end

  def self.encrypt(password)
    BCrypt::Password.create(ENV['PEPPER'] + password)
  end

  def self.authenticate(email: , password: )
    result = PGDatabase.select_user_email(email: email)
    if result && BCrypt::Password.new(result['password']) == ENV['PEPPER'] + password
      User.new(id: result['id'], email: result['email'])
    else
      return
    end
  end

  def self.send_booking_request(requester_id:, property_id:)
    p requester_id
    p property_id
    PGDatabase.insert_request(requester_id: requester_id, property_id: property_id)
  end

  private_class_method :encrypt

  def initialize(id:, email:)
    @id = id
    @email = email
    # @requests_received = get_my_requests
  end

  attr_reader :id, :email, :password


end
