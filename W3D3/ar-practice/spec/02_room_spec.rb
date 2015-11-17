require './spec_helper'

describe Room do

  before :each do
    @booking = Booking.new
    @room = Room.new
  end

  describe 'associations' do
    
    it "should be able to get its bookings" do
      expect { @room.bookings }.to_not raise_error
    end

    it "should be able to set its bookings" do
      expect { @room.bookings.new }.to_not raise_error
    end
  end
  
end