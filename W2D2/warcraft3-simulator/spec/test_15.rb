require_relative 'spec_helper'

describe SeigeEngine do
  before :each do
    @seigeengine = SeigeEngine.new
  end

  it "should have 50 attack power" do
    expect(@seigeengine.attack_power).to eq(50)
  end

  it "should have 400 health points" do
    expect(@seigeengine.health_points).to eq(400)
  end

  describe "#attack!" do
    it "should reduce a barrack's health points by double its ap" do
      barracks = Barracks.new
      @seigeengine.attack!(barracks)
      expect(barracks.health_points).to eq(400)
    end

    it "should reduce a seige engine's health ponts by its ap" do
      sg = SeigeEngine.new
      @seigeengine.attack!(sg)
      expect(sg.health_points).to eq(350)
    end

    it "should not attack a Peasant" do
      peasant = Peasant.new
      @seigeengine.attack!(peasant)
      expect(peasant.health_points).to eq(35)
    end

    it "should not attack a Footman" do
      footman = Footman.new
      @seigeengine.attack!(footman)
      expect(footman.health_points).to eq(60)
    end
  end
end