require 'property'

describe Property do
  describe '.all' do
    it 'lists all the properties in table' do
      user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
      property = Property.add(name: 'House1', description: 'this is a description', price: 5, availability: "1", user_id: user.id)
      Property.add(name: 'House2', description: 'this is another description', price: 10, availability: "0", user_id: user.id)

      result = Property.all

      expect(result.length).to eq 2
      expect(result.first.name).to eq 'House1' 
      expect(result.first.description).to eq 'this is a description'
      expect(result.first.price).to eq 5
      expect(result.first.availability).to eq true
      expect(result.first.id).to eq property.id
    end
  end

  describe '.add' do
    it 'can add a new property to the table' do
      user = User.add_new_user(email: 'user@dnb.co.uk', password: "password")
      property = Property.add(name: 'House2', description: 'this is a description 2', price: 6, availability: false, user_id: user.id)
      result =  PGDatabase.select_property(id: property.id)
      result = result.first

      expect(property).to be_a Property
      expect(property.name).to eq result['name']
      expect(property.description).to eq result['description']
      expect(property.price).to eq result['price'].to_i
      expect(property.availability).to eq false
    end
  end
end

