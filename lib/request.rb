class Request
  attr_reader :property_name, :requester

  def initialize(property_name: , requester: )
    @property_name = property_name
    @requester = requester
  end
end