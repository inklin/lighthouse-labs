require_relative '../lib/frog'

describe Frog do
  it "should create new Frogs" do 
    expect(Frog.new).to be_a Frog
  end
  it "should be cold blooded" do
    expect(Frog.new.cold_blooded?).to be true
  end
end