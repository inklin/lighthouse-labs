class Teacher < ActiveRecord::Base

  has_many :students
  
  validates :email, presence: true, uniqueness: true
  validate :retirement_cannot_be_before_hire
  validate :retirement_cannot_be_in_future, if: :retirement_date

  after_save :remove_students_after_retire

  private

  def retirement_cannot_be_before_hire
    if retirement_date && hire_date
      errors.add(:retirement_date, "cannot be before hire_date") if retirement_date < hire_date
    end
  end

  def retirement_cannot_be_in_future
    if retirement_date > Date.today
      errors.add(:retirement_date, "cannot be in the future")
    end
  end

  def remove_students_after_retire
    if retirement_date
      students.each do |student|
        student.teacher = nil
        student.save
      end
    end
  end

end