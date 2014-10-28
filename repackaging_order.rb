class RepackagingOrder
  attr_accessor :base_price, :type, :required_employees_quantity
  
  def initialize(base_price, type, required_employees_quantity = 1)
    #Instance variables
    raise "Must have a numeric base_price value greater than 0" if base_price <= 0
    raise "Must have a type parameter given as a string" unless type.is_a?(String)
    raise "Must have an integer required_employees_quantity value equal or greater than 1" if !required_employees_quantity.is_a?(Integer) || required_employees_quantity < 1
    @base_price = base_price
    @type = type
    @required_employees_quantity = required_employees_quantity
  end
end