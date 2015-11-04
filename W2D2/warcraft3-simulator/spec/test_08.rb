require_relative 'spec_helper'

# Peasants are also units, but they are not soldiers like Footman are
# These guys have other duties like mining for resources (let's not worry about that for now)
# For our intents and purposes, Peasants are just another Unit which have lower HP and no AP (they can't attack other units)

describe Peasant do

  before :each do
    @peasant = Peasant.new
  end

  it "has and knows its HP, which is lower than that of a Footman" do
    expect(@peasant.health_points).to eq(35)
  end

  it "can't damage other units (no attack power)" do
    expect(@peasant.attack_power).to eq(0)
  end

end
