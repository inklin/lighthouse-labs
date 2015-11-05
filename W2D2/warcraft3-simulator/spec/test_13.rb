require_relative 'spec_helper'

describe Unit do
  describe "#attack!" do
    before :each do
      @enemy = Unit.new(50, 50)
      @unit = Unit.new(50, 50)
    end

    it "should not attack another unit if it is dead" do
      expect(@unit).to receive(:dead?).and_return true
      @unit.attack!(@enemy)
      expect(@enemy.health_points).to eq(50)
    end

    it "should not attack a dead unit" do
      expect(@enemy).to receive(:dead?).and_return true
      @unit.attack!(@enemy)
      expect(@enemy.health_points).to eq(50)
    end
  end
end