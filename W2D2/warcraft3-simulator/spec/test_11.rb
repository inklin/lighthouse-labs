require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "should have 500 HP" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the barracks' health points by the ap specified" do
      @barracks.damage(10)
      expect(@barracks.health_points).to eq(490)
    end
  end
  
end

describe Footman do
  describe "#attack!" do
    it "should reduce a barrack's health points by half its own ap" do
      footman = Footman.new
      barracks = Barracks.new
      footman.attack!(barracks)
      expect(barracks.health_points).to eq(495)
    end
  end
end