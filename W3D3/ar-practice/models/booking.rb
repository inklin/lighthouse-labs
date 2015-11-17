class Booking < ActiveRecord::Base

  validates_presence_of :room_id, :guest_id, :start_date, :end_date, presence: true
  validate :end_time_is_after_start_time
  belongs_to :room
  belongs_to :guest

  # TODO: before save, check that room is available for booking
  # add custom error message

  # Callbacks
  after_destroy :log_destroy_action

  def log_destroy_action
    puts "Booking cancelled"
  end

  private
  def end_time_is_after_start_time
    return unless start_date && end_date

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start time")
    end
  end

end