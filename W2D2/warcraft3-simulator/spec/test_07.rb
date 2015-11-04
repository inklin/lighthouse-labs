require_relative 'spec_helper'

# A Footman should be able to attack other units as well as receive damage
# Later on, other units such as the peasant will be incapable of attacking

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal 10 (AP) damage to the enemy unit" do
      enemy = Footman.new
      expect(enemy).to receive(:damage).with(10)
      @footman.attack!(enemy)
    end
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @footman.damage(4)
      expect(@footman.health_points).to eq(56) # starts at 60
    end
  end

end
