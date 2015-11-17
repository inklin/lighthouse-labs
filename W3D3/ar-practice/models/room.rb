class Room < ActiveRecord::Base

  has_many :bookings
  validates :name, presence: true

  # add #available? for each room
  # checks all the bookings within specified date range
  # takes in (start_date, end_date)
  # if any bookings in that time frame, return false
end