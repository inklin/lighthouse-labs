class User < ActiveRecord::Base

  has_many :songs
  has_many :votes
  has_many :reviews
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
end