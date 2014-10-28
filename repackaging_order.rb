class RepackagingOrder
  def initialize(base_price, type)
    #Instance variables
    raise "Must have base_price" if base_price.nil?
    raise "Must have type" if type.nil?
    @base_price = base_price
    @type = type
  end
end