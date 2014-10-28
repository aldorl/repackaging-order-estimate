class RepackagingOrder
  attr_accessor :base_price, :type, :required_employees_quantity
  
  def initialize(base_price, type, required_employees_quantity = 1)
    #Instance variables
    raise "Must have base_price" if base_price.nil?
    raise "base_price must be a numeric value" unless base_price.is_a?(Numeric)
    raise "base_price cannot be equal or less than 0" if base_price <= 0
    raise "Must have type" if type.nil?
    raise "type must be a string value" unless type.is_a?(String)
    raise "required_employees_quantity must be an integer value" unless required_employees_quantity.is_a?(Integer)
    raise "Must be equal or greater than 1" if required_employees_quantity < 1
    @base_price = base_price
    @type = type
    @required_employees_quantity = required_employees_quantity
  end
end