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

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  describe "#build_seige_engine" do
    it "costs 200 gold" do
      @barracks.build_seige_engine
      expect(@barracks.gold).to eq(800)
    end

    it "costs 3 food" do
      @barracks.build_seige_engine
      expect(@barracks.food).to eq(77)
    end

    it "costs 60 lumber" do
      @barracks.build_seige_engine
      expect(@barracks.lumber).to eq(440)
    end
  end
end