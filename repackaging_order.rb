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
  
  def increase_required_employees_quantity
    self.required_employees_quantity += 1
  end
  
  def decrease_required_employees_quantity
    raise "Cannot reduce the number of employees under one" if required_employees_quantity == 1
    self.required_employees_quantity -= 1
  end
  
  def final_cost_estimate
    total_extra_markup_percentage = 0.012 * required_employees_quantity
    
    case type
    when "food"
      total_extra_markup_percentage += 0.13
    when "drugs"
      total_extra_markup_percentage += 0.075
    when "electronics"
      total_extra_markup_percentage += 0.02
    end
    
    return calculate_cost_including_markup(flat_markup, total_extra_markup_percentage)
  end
  
  private
    def flat_markup
      flat_markup_percentage = 0.05
      return calculate_cost_including_markup(base_price, flat_markup_percentage)
    end
    
    def calculate_cost_including_markup(base_price, markup_percentage)
      (base_price*(1+markup_percentage)).round(2)
    end
end