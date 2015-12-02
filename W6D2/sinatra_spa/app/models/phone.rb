class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :context, presence: true
  validates :digits, presence: true
  validates :contact_id, presence: true
  
end