require_relative 'spec_helper'

# Resources allow you to create units. In our case (for simplicity), these resources will be stored directly within the barracks

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 1000 gold resources" do
    expect(@barracks.gold).to eq(1000)
  end

  it "starts off with 80 food resources" do
    expect(@barracks.food).to eq(80)
  end



end
