class Contact < ActiveRecord::Base
  has_many :phones

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  
  def self.search(term)
    where("firstname LIKE :searchterm OR lastname LIKE :searchterm", {searchterm: term})
  end

end