require_relative 'spec_helper'

# Barracks should also be able to train peasants, much like they could train footmen

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_peasant" do
    it "costs 90 gold" do
      @barracks.train_peasant
      expect(@barracks.gold).to eq(910) # starts at 1000
    end

    it "costs 5 food" do
      @barracks.train_peasant
      expect(@barracks.food).to eq(75) # starts at 80
    end

    it "produces a peasant unit" do
      peasant = @barracks.train_peasant
      expect(peasant).to be_an_instance_of(Peasant)
    end
  end

  describe "#can_train_peasant?" do
    it "returns true if there are enough resources to train a peasant" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple peasants
      expect(@barracks.can_train_peasant?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(4)
      expect(@barracks.can_train_peasant?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(89)
      expect(@barracks.can_train_peasant?).to be_falsey
    end
  end

  describe "#train_peasant" do
    it "does not train a peasant if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_peasant?).and_return(false)
      expect(@barracks.train_peasant).to be_nil
    end
    it "trains a peasant if there are enough resources" do
      expect(@barracks).to receive(:can_train_peasant?).and_return(true)
      expect(@barracks.train_peasant).to be_a(Peasant)
    end
  end

end
