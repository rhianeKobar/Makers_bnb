require 'pg'

class Property
  attr_reader :id, :name, :description, :price, :availability

  def initialize(id:, name:, description:, price:, availability:)
    @id = id
    @name = name
    @description = description
    @price = price.to_i
    @availability = to_boolean(availability)
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bnb_test')
    else
      connection = PG.connect(dbname: 'bnb')
    end
    result = connection.exec("SELECT * FROM properties;")
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'], availability: property['availability'])
    end
  end

  private

  def to_boolean(availability)
    availability == "t"
  end
end
