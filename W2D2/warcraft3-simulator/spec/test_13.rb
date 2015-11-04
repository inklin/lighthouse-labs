require_relative 'spec_helper'

describe Unit do
  it "should not attack another unit if it is dead" do
    unit = Unit.new(0, 50)
    enemy = Unit.new(50, 50)
    unit.attack!(enemy)
    expect(enemy.health_points).to eq(50)
  end

  it "should not attack a dead unit" do
    unit = Unit.new(50, 30)
    enemy = Unit.new(0, 30)
    unit.attack!(enemy)
    expect(enemy.health_points).to eq(0)
  end
end