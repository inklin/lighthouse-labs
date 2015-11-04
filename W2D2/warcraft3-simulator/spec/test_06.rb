require_relative 'spec_helper'

# Since a Footman is a type of Unit, it makes sense to now make Footman inherit from Unit
# Furthermore,

# This test doesn't look for it, but there are other things that you could do at this point. Think about what else you could refactor in the Footman class, now that it is inheriting functionality (code) from the Unit class.

describe Footman do

  before :each do
    @footman = Footman.new
  end

  it "should be a Unit" do
    expect(@footman).to be_an_instance_of(Footman)
    # But should also be a Unit
    expect(@footman).to be_a(Unit)
  end

end
