class Student < ActiveRecord::Base

  belongs_to :teacher

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }, on: :create
  validates :birthday, presence: true

  validate :cannot_be_a_toddler, on: :create
  validate :cannot_have_a_retired_teacher, if: :teacher

  after_save :update_teacher, if: :teacher

  def name
    "#{first_name} #{last_name}"
  end

  def age
    age = Date.today.year - birthday.year
    age -= 1 if upcoming_birthday?
    age
  end

  private

  def cannot_be_a_toddler
    errors.add(:birthday, "can't be a toddler!") unless age > 3
  end

  def upcoming_birthday?
     Date.today.yday < birthday.yday
  end

  def update_teacher
    teacher.last_student_added_at = Date.today
    teacher.save
  end

  def cannot_have_a_retired_teacher
    if teacher.retirement_date
      errors.add(:teacher_id, "cannot be a retired teacher")
    end
  end

end
