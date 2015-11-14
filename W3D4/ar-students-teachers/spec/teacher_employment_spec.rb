require_relative 'spec_helper'

describe Teacher do

  before :each do
    @teacher = Teacher.new
    @teacher.assign_attributes(
        name: 'Professor Smartypants',
        email: 'smartypants@gmail.com',
        address: '100 College',
        phone: '(510) 111-1111',
      )
  end

  describe "#retirement_date" do

    it "should not be required" do
      expect(@teacher).to be_valid
    end

    it "should not be before hire_date" do
      @teacher.hire_date = 1.day.ago
      @teacher.retirement_date = 2.days.ago
      expect(@teacher).to_not be_valid
    end

    it "should not be in the future" do
      future_date = Date.today + 1
      @teacher.retirement_date = future_date
      expect(@teacher).to_not be_valid
    end

  end

  describe "#hire_date" do 

    it "should not be required" do
      expect(@teacher).to be_valid
    end
  end

end