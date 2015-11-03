require_relative '../lib/parrot'

describe Parrot do
  it "should create Parrots" do
    parrot = Parrot.new
    expect(parrot).to be_a Parrot
  end

  it "should have two legs" do
    parrot = Parrot.new
    expect(parrot.num_legs).to be 2
  end

  it "should have feathers" do
    parrot = Parrot.new
    expect(parrot.has_feathers?).to be true
  end

  it "should fly" do
    parrot = Parrot.new
    expect(parrot.fly).to eq("I am a Parrot. I am flying!")
  end

  it "should have an airspeedvelocity" do
    parrot = Parrot.new
    expect(parrot.airspeedvelocity).to eq(0)
  end

  it "should be able to have its airspeedvelocity changed" do
    parrot = Parrot.new
    parrot.airspeedvelocity = 10
    expect(parrot.airspeedvelocity).to eq(10)
  end
end