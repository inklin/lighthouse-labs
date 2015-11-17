class Guest < ActiveRecord::Base

  has_many :bookings
  validates :name, presence: true
  
end