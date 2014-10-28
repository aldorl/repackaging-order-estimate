require 'spec_helper'

describe RepackagingOrder do
  it "is valid with a base_price and a type" do
    expect{RepackagingOrder.new("1299.99", :food)}.not_to raise_error 
  end
  
  it "is invalid without a type" do
    expect{RepackagingOrder.new("1299.99", :nil)}.to raise_error 
  end
  
  it "is invalid without a base_price" do
    expect{RepackagingOrder.new(:nil, :food)}.to raise_error 
  end
end