require 'pg'

class Property
  attr_reader :id, :name, :description, :price, :availability

  def initialize(id:, name:, description:, price:, availability: )
    @id = id
    @name = name
    @description = description
    @price = price.to_i
    @availability = availability
  end

  def self.all
    result = PGDatabase.select_properties
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'], availability: property['availability'])
    end
  end

  def self.add(name:, description:, price:, availability: , user_id: )
    result = PGDatabase.insert_property(name: name, description: description, price: price, availability: availability, user_id: user_id)
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], availability: result[0]['availability'])
  end

  private 

  # need to refactor
  def to_boolean(availability)
    availability == 1.0
  end
  
end
