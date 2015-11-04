require_relative 'spec_helper'

# A unit is a common term in strategy games like Warcraft 3 and it stands for a soldier or person that performs a task of some kind. A footman is just one of many "units" that a barracks can train.

# So let's use inheritence. First we'll introduce a new class (create a new file called unit.rb for it).
# The Unit is an abstract idea and thus it needs to be told what the HP and AP for the unit will be

# Since all units have health, the HP related stuff can be migrated/moved into the Unit class instead.

describe Unit do

  describe "initialization" do

    it "requires HP and AP instead of defaulting them" do
      unit = Unit.new(30, 5)
    end

  end

  describe "#health_points" do

    before :each do
      @unit = Unit.new(30, 5)
    end

    it "can be retrieved (read)" do
      expect(@unit.health_points).to eq(30)
    end

    it "cannot be set (written) once initialized" do
      expect { @unit.health_points = 500 }.to raise_error(NoMethodError)
    end

  end

end
