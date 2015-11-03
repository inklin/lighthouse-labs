require '../lib/animal'
require '../lib/mammal'
require '../lib/primate'
require '../lib/chimpanzee'

describe Chimpanzee do
  it "should create Chimpanzees" do
    expect(Chimpanzee.new).to be_a Chimpanzee
  end

  it "should have two legs" do
    expect(Chimpanzee.new.num_legs).to be 2
  end
end