require_relative 'spec_helper'

describe Student, 'Sample data' do
  before :each do
    students_fixture_path = File.absolute_path('fixtures/students.csv', File.dirname(__FILE__))
    StudentsImporter.new(students_fixture_path).import
  end

  it 'should contain one of the students from the CSV' do
    expect(Student.where('first_name = ? AND last_name = ?', 'Ian', 'Smith').exists?).to be(true)
  end
end
