require_relative 'boat'

describe Boat do
  it 'should create boats' do
    expect(Boat.new).to be_a Boat
  end

  describe "#allowed_board?" do
    it 'returns true if inventory includes a life jacket' do
      a_boat = Boat.new
      allowed = a_boat.allowed_aboard?(['life jacket', 'sun glasses'])
      expect(allowed).to be true
    end
    it 'returns false if inventory does not include a life jacket' do
      a_boat = Boat.new
      allowed = a_boat.allowed_aboard?(['swim trunks', 'flippy floppies'])
      expect(allowed).to be false
    end
  end
end