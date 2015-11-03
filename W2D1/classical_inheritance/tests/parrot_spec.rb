require '../lib/animal'
require '../lib/bird'
require '../lib/parrot'

describe Parrot do
  parrot = Parrot.new
  it "should create Parrots" do
    expect(parrot).to be_a Parrot
  end

  it "should have two legs" do
    expect(parrot.num_legs).to be 2
  end

  it "should have feathers" do
    expect(parrot.has_feathers?).to be true
  end

  it "should fly" do
    expect(parrot.fly).to eq("I am a Parrot. I am flying!")
  end

  it "should have an airspeedvelocity" do
    expect(parrot.airspeedvelocity).to eq(0)
  end

  it "should be able to have its airspeedvelocity changed" do
    parrot.airspeedvelocity = 10
    expect(parrot.airspeedvelocity).to eq(10)
  end
end