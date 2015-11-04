require_relative 'spec_helper'

describe Unit do
  it "should be dead if its health points is 0" do
    unit = Unit.new(0, 50)
    expect(unit.dead?).to be true
  end

  it "should be dead if its health points is 0" do
    unit = Unit.new(-10, 50)
    expect(unit.dead?).to be true
  end

  it "should not be dead if its health points is greater than 0" do
    unit = Unit.new(10, 50)
    expect(unit.dead?).to be false
  end
end