class RepackagingOrder
  FLAT_MARKUP_PERCENTAGE        = 0.05
  EMPLOYEE_MARKUP_PERCENTAGE    = 0.012
  FOOD_MARKUP_PERCENTAGE        = 0.13
  DRUGS_MARKUP_PERCENTAGE       = 0.075
  ELECTRONICS_MARKUP_PERCENTAGE = 0.02
  
  attr_accessor :base_price, :type, :required_employees_quantity
  
  def initialize(base_price, type, required_employees_quantity = 1)
    # Data types validation
    raise "Must have a numeric base_price value greater than 0" if base_price <= 0
    raise "Must have a type parameter given as a string" unless type.is_a?(String)
    raise "Must have an integer required_employees_quantity value equal or greater than 1" if !required_employees_quantity.is_a?(Integer) || required_employees_quantity < 1
    #Instance variables
    @base_price = base_price
    @type = type
    @required_employees_quantity = required_employees_quantity
  end
  
  def increase_required_employees_quantity
    modify_required_employees_quantity(required_employees_quantity+1)
  end
  
  def decrease_required_employees_quantity
    modify_required_employees_quantity(required_employees_quantity-1)
  end
  
  def modify_required_employees_quantity(new_required_employees_quantity)
    raise "New required_employees_quantity has to be an integer value equal or greater than 1" if !new_required_employees_quantity.is_a?(Integer) || new_required_employees_quantity < 1
    self.required_employees_quantity = new_required_employees_quantity
  end
  
  def final_cost_estimate
    total_extra_markup_percentage = EMPLOYEE_MARKUP_PERCENTAGE * required_employees_quantity
    
    case type
    when "food"
      total_extra_markup_percentage += FOOD_MARKUP_PERCENTAGE
    when "drugs"
      total_extra_markup_percentage += DRUGS_MARKUP_PERCENTAGE
    when "electronics"
      total_extra_markup_percentage += ELECTRONICS_MARKUP_PERCENTAGE
    end
    
    return calculate_cost_including_markup(flat_markup, total_extra_markup_percentage)
  end
  
  private
    def flat_markup
      return calculate_cost_including_markup(base_price, FLAT_MARKUP_PERCENTAGE)
    end
    
    def calculate_cost_including_markup(base_price, markup_percentage)
      (base_price*(1+markup_percentage)).round(2)
    end
end