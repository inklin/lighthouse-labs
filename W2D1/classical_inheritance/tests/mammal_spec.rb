require '../lib/animal'
require '../lib/mammal'

describe Mammal do
  it "should create Mammals" do
    expect(Mammal.new).to be_a Mammal
  end
end