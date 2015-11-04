require_relative 'spec_helper'

# A Barracks should only be able to train footmen if it has enough resources
# Introduce a new method that checks to see if there are enough resources to train one
# Of course, it should then also be leveraged by the train_footman method

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_train_footman?" do
    it "returns true if there are enough resources to train a footman" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple footmen
      expect(@barracks.can_train_footman?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 1 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_train_footman?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_train_footman?).to be_falsey
    end
  end

  describe "#train_footman" do
    it "does not train a footman if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_footman?).and_return(false)
      expect(@barracks.train_footman).to be_nil
    end
    it "trains a footman if there are enough resources" do
      expect(@barracks).to receive(:can_train_footman?).and_return(true)
      expect(@barracks.train_footman).to be_a(Footman)
    end
  end

end
