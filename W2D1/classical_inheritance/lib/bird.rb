require_relative 'animal'
require_relative 'flight'

class Bird < Animal
  include Flight

  attr_reader :num_legs

  def initialize
    @num_legs = 2
    @airspeedvelocity = 0
  end

  def has_feathers?
    true
  end
end