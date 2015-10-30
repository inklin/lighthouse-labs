class Player
  attr_accessor :name, :lives, :score
  attr_reader :color

  def initialize(color)
    @name = ""
    @lives = 3
    @score = 0
    @color = color
  end

  def dead?
    self.lives <= 0
  end

  def minus_life
    self.lives -= 1
  end

  def add_score
    self.score += 1
  end

  def show_score
    puts "#{self.name}'s score: #{self.score}."
  end
end