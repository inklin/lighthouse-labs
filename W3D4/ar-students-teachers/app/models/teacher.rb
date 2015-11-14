class Teacher < ActiveRecord::Base

  has_many :students
  
  validates :email, presence: true, uniqueness: true
  
end