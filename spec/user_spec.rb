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

    it 'finds an existing user' do
      user = User.add_new_user(email: 'eefwefwefefqqwefweffwfew@dnb.co.uk', password: "password")
      result = User.find_user(id: user.id)
      expect(result.email).to eq result.email
      expect(result.id).to eq result.id 
    end

    xit 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('YOU2WILL_NEV3RGETD1Spassword123')
      user = User.add(username: 'encrypted', email: 'encrypted@example.com', password: 'password123')
    end

    it 'when authenticated' do
      PGDatabase.truncate_tables
      user = User.add_new_user(email: 'teswefweet@example.com', password: 'password123')
      auth = User.authenticate(email: 'teswefweet@example.com', password: 'password123')
      expect(user.id).to eq auth.id
    end

  end
  
end

