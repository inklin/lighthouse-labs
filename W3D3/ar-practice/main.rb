require_relative 'spec_helper'

guest = Guest.create()
puts guest.inspect
puts guest.valid?

guest1 = Guest.create(name: 'Stacey')
room1 = Room.create(name: 'Blue Room')

puts Guest.all.inspect
puts Room.all.inspect

booking = Booking.create(start_date: 5.days.ago, end_date: 3.days.ago, room_id: 1, guest_id: 1)
puts booking.inspect
puts booking.valid?