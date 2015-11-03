require_relative 'flight'

class Bat < Mammal
  include Flight
  def initialize
    @airspeedvelocity = 0
  end
end