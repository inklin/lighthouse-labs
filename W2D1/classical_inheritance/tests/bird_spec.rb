require '../lib/animal'
require '../lib/bird'

describe Bird do
  a_bird = Bird.new
  it "should create Birds" do
    expect(a_bird).to be_a Bird
  end

  it "should have two legs" do
    expect(a_bird.num_legs).to be 2
  end

  it "should have feathers" do
    expect(a_bird.has_feathers?).to be true
  end

  it "should fly" do
    expect(a_bird.fly).to eq("I am a Bird. I am flying!")
  end

  it "should have an airspeedvelocity" do
    expect(a_bird.airspeedvelocity).to eq(0)
  end

  it "should be able to have its airspeedvelocity changed" do
    a_bird.airspeedvelocity = 10
    expect(a_bird.airspeedvelocity).to eq(10)
  end
end