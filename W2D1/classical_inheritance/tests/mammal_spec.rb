require '../lib/animal'
require '../lib/mammal'

describe Mammal do
  it "should create Mammals" do
    expect(Mammal.new).to be_a Mammal
  end
  
  it "should be a vertebrate" do
    expect(Mammal.new.is_vertebrate?).to be true
  end
end