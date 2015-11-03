module Flight
  attr_accessor :airspeedvelocity

  def fly
    "I am a #{self.class.name}. I am flying!"
  end
end