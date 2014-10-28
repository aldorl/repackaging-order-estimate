class RepackagingOrder
  attr_accessor :base_price, :type, :required_employees_quantity
  
  def initialize(base_price, type, required_employees_quantity = 1)
    #Instance variables
    raise "Must have base_price" if base_price.nil?
    raise "Must have type" if type.nil?
    raise "Must be equal or greater than 1" if required_employees_quantity < 1
    @base_price = base_price
    @type = type
    @required_employees_quantity = required_employees_quantity
  end
end