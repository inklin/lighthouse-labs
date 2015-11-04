require_relative 'spec_helper'

# Now that our Barracks and Footman classes are initializable, lets allow the player to train a footman from their barracks
# This of course costs the player some resources

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_footman" do

    it "costs 135 gold" do
      @barracks.train_footman
      expect(@barracks.gold).to eq(865) # starts at 1000
    end

    it "costs 2 food" do
      @barracks.train_footman
      expect(@barracks.food).to eq(78) # starts at 80
    end

    it "produces a footman unit" do
      footman = @barracks.train_footman
      expect(footman).to be_an_instance_of(Footman)
    end

  end

end
