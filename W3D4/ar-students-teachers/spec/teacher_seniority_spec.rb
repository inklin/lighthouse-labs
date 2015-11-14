require_relative 'spec_helper'

describe Teacher do

  before :each do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      name: 'Scooby Doo',
      email: 'scoobydoo@gmail.com',
      phone: '555-5555',
      address: '10 Pineapple',
    )
  end

  describe '#days_employed' do
    it 'should return difference between hire_date and retirement_date' do
      @teacher.hire_date = 3.days.ago
      @teacher.retirement_date = 1.day.ago
      expect(@teacher.days_employed).to eq(2)
    end

    it 'should return difference between hire_date and today if not retired' do
      @teacher.hire_date = 3.days.ago
      expect(@teacher.days_employed).to eq(3)
    end

  end
end