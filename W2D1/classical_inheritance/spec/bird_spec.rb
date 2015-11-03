require_relative '../lib/bird'

describe Bird do
  it "should create Birds" do
    expect(Bird.new).to be_a Bird
  end

  it "should have two legs" do
    a_bird = Bird.new
    expect(a_bird.num_legs).to be 2
  end

  it "should have feathers" do
    a_bird = Bird.new
    expect(a_bird.has_feathers?).to be true
  end

  it "should fly" do
    a_bird = Bird.new
    expect(a_bird.fly).to eq("I am a Bird. I am flying!")
  end

  it "should have an airspeedvelocity" do
    a_bird = Bird.new
    expect(a_bird.airspeedvelocity).to eq(0)
  end

  it "should be able to have its airspeedvelocity changed" do
    a_bird = Bird.new
    a_bird.airspeedvelocity = 10
    expect(a_bird.airspeedvelocity).to eq(10)
  end
end