require 'spec_helper'

describe RepackagingOrder do
  before :all do
    @food_order = RepackagingOrder.new(1299.99, "food", 3)
    @drugs_order = RepackagingOrder.new(5432.00, "drugs")
    @books_order = RepackagingOrder.new(12456.95, "books", 4)
    @electronics_order = RepackagingOrder.new(1299.99, "electronics", 1)
  end
  
  it "is valid with a base_price and a type" do
    expect{RepackagingOrder.new(1299.99, "food")}.not_to raise_error
    expect{RepackagingOrder.new(5432, "drugs")}.not_to raise_error
  end
  
  it "is invalid without a type" do
    expect{RepackagingOrder.new(1299.99, nil)}.to raise_error 
  end
  
  it "is invalid without a base_price" do
    expect{RepackagingOrder.new(nil, "food")}.to raise_error 
  end
  
  # Every project has to have at least one person working on them by default
  it "returns a required_employees_quantity of 1 when not given this parameter" do
    expect(@drugs_order.required_employees_quantity).to eq(1)
  end
  
  # Same as it "is valid with a base_price, a type and a required_employees_quantity"
  it "returns a required_employees_quantity equal to the given required_employees_quantity parameter" do
    expect(@food_order.required_employees_quantity).to eq(3)
  end
  
  it "is invalid with a required_employees_quantity parameter of less than 1" do
    expect{RepackagingOrder.new(1299.99, "food", -100)}.to raise_error
  end
  
  it "is invalid with a base_price parameter parameter equal or less than 0" do
    expect{RepackagingOrder.new(0, "food")}.to raise_error
    expect{RepackagingOrder.new(-0.01, "food")}.to raise_error
    expect{RepackagingOrder.new(-100, "food")}.to raise_error
  end
  
  it "is invalid with a non-numeric base_price parameter" do
    expect{RepackagingOrder.new(:test, "food")}.to raise_error
  end
  
  it "is invalid with a non-integer required_employees_quantity parameter" do
    expect{RepackagingOrder.new(1299.99, "food", 4.2)}.to raise_error
    expect{RepackagingOrder.new(1299.99, "food", :test)}.to raise_error
  end
  
  it "is invalid with a non-string type parameter" do
    expect{RepackagingOrder.new(1299.99, 123)}.to raise_error
    expect{RepackagingOrder.new(1299.99, :food)}.to raise_error
  end
  
  
  describe "modify required_employees_quantity" do
    it "adds one employee to the required_employees_quantity" do
      expect(@electronics_order.required_employees_quantity).to eq(1)
      @electronics_order.increase_required_employees_quantity
      expect(@electronics_order.required_employees_quantity).to eq(2)
    end
    
    it "subtracts one employee from the required_employees_quantity"
    it "changes the required_employees_quantity to the given new_required_employees_quantity parameter"
  end
  
  
  describe "calculates repackaging order estimate" do
    before :all do
      @electronics_order = RepackagingOrder.new(1299.99, "electronics", 1)
    end
    
    context "with extra markup on top of flat markup" do
      it "adds only an extra markup of 1.2% per required_employees_quantity if the repackaging order is not of type 'food', 'drugs' or 'electronics'" do
        expect(@books_order.final_cost_estimate).to eq(13707.63) #(12456.95 *1.05 round(2)) *(1 + 0.012*4) round(2)
      end
      
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 13% if the repackaging order is of type 'food'" do
        expect(@food_order.final_cost_estimate).to eq(1591.58) #(1299.99  *1.05 round(2)) *(1 + 0.012*3 + 0.130) round(2)
      end
      
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 7.5% if the repackaging order is of type 'drugs'" do
        expect(@drugs_order.final_cost_estimate).to eq(6199.81) #(5432.00  *1.05 round(2)) *(1 + 0.012*1 + 0.075) round(2)
      end
      
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 2% if the repackaging order is of type 'electronics'" do
        expect(@electronics_order.final_cost_estimate).to eq(1408.67) #(1299.99  *1.05 round(2)) *(1 + 0.012*1 + 0.020) round(2)
      end
    end
    
    context "with modified required_employees_quantity" do
      it "adds an extra markup of 1.2% after adding one employee to the required_employees_quantity"
      it "subtracts an extra markup of 1.2% after subtracting one employee from the required_employees_quantity"
      it "includes an extra markup of 1.2% per required_employees_quantity after changing the required_employees_quantity to the given new_required_employees_quantity parameter"
    end
  end
  
end