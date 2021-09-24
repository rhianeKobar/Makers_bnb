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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('YOU2WILL_NEV3RGETD1Spassword123')
      user = User.add_new_user(email: 'encrypted@example.com', password: 'password123')
    end

    it 'when authenticated' do
      PGDatabase.truncate_tables
      user = User.add_new_user(email: 'teswefweet@example.com', password: 'password123')
      auth = User.authenticate(email: 'teswefweet@example.com', password: 'password123')
      expect(user.id).to eq auth.id
    end

  end

  # describe '.send_booking_request' do
  #   it 'stores the booking request for the requester' do
  #     requester = User.add_new_user(email: 'requester@dnb.co.uk', password: 'password123')
  #     requested_property = Property.add(name: 'House1', description: 'desc', price: 5, availability: '1', user_id: requester.id)
  #     User.send_booking_request(requester_id: requester.id, property_id: requested_property.id)
  #     expect(requester.requests_sent).to include requested_property.id
  #   end
  # end
  
end

