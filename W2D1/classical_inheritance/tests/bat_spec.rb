require '../lib/animal'
require '../lib/mammal'
require '../lib/bat'

describe Bat do
  it "should create new Bats" do
    expect(Bat.new).to be_a Bat
  end

  it "should fly" do
    a_bat = Bat.new
    expect(a_bat.fly).to eq("I am a Bat. I am flying!")
  end

  it "should have an airspeedvelocity" do
    a_bat = Bat.new
    expect(a_bat.airspeedvelocity).to eq(0)
  end

  it "should be able to have its airspeedvelocity changed" do
    bat = Bat.new
    bat.airspeedvelocity = 1000
    expect(bat.airspeedvelocity).to eq(1000)
  end
end