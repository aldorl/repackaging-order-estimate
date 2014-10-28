require 'spec_helper'

describe RepackagingOrder do
  it "is valid with a base_price and a type" do
    expect{RepackagingOrder.new("1299.99", :food)}.not_to raise_error
  end
  
  it "is invalid without a type" do
    expect{RepackagingOrder.new("1299.99", nil)}.to raise_error 
  end
  
  it "is invalid without a base_price" do
    expect{RepackagingOrder.new(nil, :food)}.to raise_error 
  end
  
  # Every project has to have at least one person working on them by default
  it "returns a required_employees_quantity of 1 when not given this parameter" do
    repackaging_order = RepackagingOrder.new("1299.99", :food)
    expect(repackaging_order.required_employees_quantity).to eq(1)
  end
  
  it "returns a required_employees_quantity equal to the given required_employees_quantity parameter" do
    repackaging_order = RepackagingOrder.new("1299.99", :food, 3)
    expect(repackaging_order.required_employees_quantity).to eq(3)
  end
  
  it "is invalid with a required_employees_quantity parameter of less than 1" do
    expect{RepackagingOrder.new("1299.99", :food, -100)}.to raise_error
  end
end