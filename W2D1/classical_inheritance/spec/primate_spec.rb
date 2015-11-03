require_relative '../lib/primate'

describe Primate do
  it "should create Primates" do
    expect(Primate.new).to be_a Primate
  end

  it "should have two legs" do
    expect(Primate.new.num_legs).to be 2
  end
end