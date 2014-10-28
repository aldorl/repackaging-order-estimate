require 'spec_helper'

describe RepackagingOrder do
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
    repackaging_order = RepackagingOrder.new(1299.99, "food")
    expect(repackaging_order.required_employees_quantity).to eq(1)
  end
  
  # Same as it "is valid with a base_price, a type and a required_employees_quantity"
  it "returns a required_employees_quantity equal to the given required_employees_quantity parameter" do
    repackaging_order = RepackagingOrder.new(1299.99, "food", 3)
    expect(repackaging_order.required_employees_quantity).to eq(3)
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
  
  
  describe "calculates repackaging order estimate" do    
    context "with flat markup only"  do
      it "adds a flat markup of 5% to the base_price to any type of repackaging order"
    end
    
    context "with extra markup on top of flat markup" do
      it "adds only an extra markup of 1.2% per required_employees_quantity if the repackaging order is not of type 'food', 'drugs' or 'electronics'"
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 13% if the repackaging order is of type 'food'"
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 7.5% if the repackaging order is of type 'drugs'"
      it "adds an extra markup of 1.2% per required_employees_quantity and an extra markup of 2% if the repackaging order is of type 'electronics'"
    end
  end
  
end