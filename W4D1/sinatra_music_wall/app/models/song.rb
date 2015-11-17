class Song < ActiveRecord::Base

  has_many :votes
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :user_id, presence: true


end