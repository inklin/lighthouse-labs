require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "should have 500 HP" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the barracks' health points by half the ap specified" do
      @barracks.damage(25)
      expect(@barracks.health_points).to eq(487)
    end
  end
  
end