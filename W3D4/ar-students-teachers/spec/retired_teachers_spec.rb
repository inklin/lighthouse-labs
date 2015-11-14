require 'pry'
require_relative 'spec_helper'

describe Teacher do

  describe '#save' do

    before :each do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        name: 'Mister D',
        email: 'misterd@gmail.com',
        phone: '(555) 222-2222',
        address: '10 Donut Town',
      )

      @student = Student.create(
        first_name: 'Happy',
        last_name: 'Gilmore',
        gender: 'male',
        birthday: Date.new(1970, 9, 1),
        email: 'hgil@gmail.com'
        )
      @student.teacher = @teacher
      @student.save

    end

    it 'should remove students if teacher has retirement_date' do
      @teacher.retirement_date = Date.today
      @teacher.save
      @student.reload
      expect(@student.teacher_id).to eq(nil)
    end

    it 'should not remove students if teacher does not have retirement date' do
      @teacher.save
      @student.reload
      expect(@student.teacher_id).to eq(1)
    end

  end

end