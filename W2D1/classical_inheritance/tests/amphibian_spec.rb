require '../lib/animal'
require '../lib/amphibian'

describe Amphibian do
  it "should create Amphibians" do
    expect(Amphibian.new).to be_a Amphibian
  end

  it "should be cold blooded" do
    amphibian = Amphibian.new
    expect(amphibian.cold_blooded?).to be true
  end
end