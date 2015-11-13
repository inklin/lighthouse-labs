require_relative 'spec_helper'

describe Teacher do
  context 'validations' do

    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        name: 'Professor Dinh',
        email: 'dinh@gmail.com',
        phone: '(510) 555-1212',
        address: '10 Pine Street'
      )
    end

    it "should accept valid info" do
      expect(@teacher).to be_valid
    end

    it "should not accept duplicate email" do
      Teacher.create!(
        name: @teacher.name, 
        email: @teacher.email
        )
      expect(@teacher).to_not be_valid
    end
  end
end