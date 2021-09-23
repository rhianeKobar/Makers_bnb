require 'user'

describe User do

  describe '.add_new_user' do
    it 'adds a new user to the database' do
      user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
      result = PGDatabase.select_user(id: user.id)

      expect(user).to be_a User
      expect(user.email).to eq result['email']
      # need a test to check for password consistency
    end


    xit 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('YOU2WILL_NEV3RGETD1Spassword123')
      user = User.add(username: 'encrypted', email: 'encrypted@example.com', password: 'password123')
    end

  end
  
end

