require './spec_helper'

describe Guest do

  before :each do
    @booking = Booking.new
    @guest = Guest.new
  end

  describe 'associations' do
    
    it "should be able to get their bookings" do
      expect { @guest.bookings }.to_not raise_error
    end

    it "should be able to set their bookings" do
      expect { @guest.bookings.new }.to_not raise_error
    end
  end
  
end