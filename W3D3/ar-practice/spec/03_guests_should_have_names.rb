require './spec_helper'

describe Guest do
  
  before :each do
    @guest = Guest.new
  end

  describe '#name' do
    it 'is required' do
      expect(@guest).to_not be_valid
      expect(@guest.errors[:name]).to eq(["can't be blank"])
    end
  end
end