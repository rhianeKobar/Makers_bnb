require 'pg'

class Property
  attr_reader :id, :name, :description, :price, :availability

  def initialize(id:, name:, description:, price:, availability:)
    @id = id
    @name = name
    @description = description
    @price = price.to_i
    @availability = availability
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect('localhost','5432','','','bnb_test','postgres','postgres')
    else
      connection = PG.connect('localhost','5432','','','bnb','postgres','postgres')
    end
    result = connection.exec("SELECT * FROM properties;")
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'], availability: property['availability'])
    end
  end

  def self.add(name:, description:, price:, availability:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect('localhost','5432','','','bnb_test','postgres','postgres')
    else
      connection = PG.connect('localhost','5432','','','bnb','postgres','postgres')
    end
    result = connection.exec_params("INSERT INTO properties (name, description, price, availability) VALUES($1, $2, $3, $4) RETURNING id, name, description, price, availability;", [name,description,price,availability])
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], availability: result[0]['availability'])
  end

  def Property.to_boolean(availability)
    if availability == 1.0
      true
    else
      false
    end
  end
end
