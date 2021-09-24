require 'pg'
require_relative './request'

class Property

  def self.all
    result = PGDatabase.select_properties
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'], availability: property['availability'])
    end
  end

  def self.add(name:, description:, price:, availability: , user_id: )
    result = PGDatabase.insert_property(name: name, description: description, price: price, availability: to_boolean(availability), user_id: user_id)
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], availability: result[0]['availability'])
  end

  def self.to_boolean(availability)
    availability == "1"
  end

  def self.get_requests(user_id:)
    result =  PGDatabase.get_requests(user_id: user_id)
    result.map { |row| 
      Request.new(property_name: row["name"], requester: row["email"])
    }
  end

  private_class_method :to_boolean

  attr_reader :id, :name, :description, :price, :availability

  def initialize(id:, name:, description:, price:, availability: )
    @id = id
    @name = name
    @description = description
    @price = price.to_i
    @availability = to_boolean_from_db(availability)
  end

  private 

  def to_boolean_from_db(availability)
    availability == "t"
  end
  
end
