require 'bcrypt'
require 'dotenv'

class User

  Dotenv.load

  def self.add_new_user(email:, password:)
    result = PGDatabase.add_new_user(email: email, password: encrypt(password))
    User.new(id: result['id'], email: result['email'], email:result['email'])
  end

  def self.encrypt(password)
    BCrypt::Password.create(ENV['PEPPER'] + password)
  end

  private_class_method :encrypt

  def initialize(id:, email:)
    @id = id
    @email = email
    # @requests_received = get_my_requests
    # @requests_sent = []
  end

  attr_reader :id, :email, :password

  # def get_my_requests
  #   PGDatabase.get_requests(id: @id)
  # end

  
end
