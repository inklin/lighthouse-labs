require_relative 'spec_helper'

describe Student do

  describe '#save' do

      it 'should update the teacher last_student_added_column date' do
        @teacher = Teacher.new
        @teacher.assign_attributes(
          name: 'Professor Spongebob',
          email: 'spongebob@gmail.com',
          phone: '(510) 111-1212',
          address: '10 Pineapple',
        )
        @teacher.save

        @student = Student.create(
          first_name: 'Happy',
          last_name: 'Gilmore',
          gender: 'male',
          birthday: Date.new(1970, 9, 1),
          email: 'gilmore@gmail.com'
          )

        @student.teacher = @teacher
        @student.save
        @teacher.reload
        expect(@teacher.last_student_added_at).to eq(Date.today)
      end

  end

end