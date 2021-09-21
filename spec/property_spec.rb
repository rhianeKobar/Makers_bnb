require 'property'

describe Property do
  describe '.all' do
    it 'lists all the properties in table' do
      connection = PG.connect(dbname: 'bnb_test')
      connection.exec("INSERT INTO properties (name, description, price, availability) VALUES ('House1','this is a description', 5, true);")
      connection.exec("INSERT INTO properties (name, description, price, availability) VALUES ('House2','this is another description', 10, false);")

      result = Property.all
      expect(result.length).to eq 2
      expect(result.first.name).to eq 'House1' 
      expect(result.first.description).to eq 'this is a description'
      expect(result.first.price).to eq 5
      expect(result.first.availability).to eq true
      # expect(result.first.id).to eq 
    end
  end
end
