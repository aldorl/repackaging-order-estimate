require 'spec_helper'

describe RepackagingOrder do
  it "is valid with a base_price and a type" do
    @repackaging_order = RepackagingOrder.new("1299.99", :food)
    expect(@repackaging_order).not_to raise_error 
  end
  
  it "is invalid without a type"
  it "is invalid without a base_price"
end