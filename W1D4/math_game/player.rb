class Player
  attr_reader :color, :lives
  attr_accessor :name

  def initialize(name, color)
    @name = name
    @lives = 3
    @score = 0
    @color = color
  end

  def dead?
    @lives <= 0
  end

  def minus_life
    @lives -= 1
  end

  def add_score
    @score += 1
  end

  def show_score
    puts "#{@name}'s score: #{@score}."
  end

  def show_life
    puts "#{@name}: You have #{@lives} remaining lives."
  end

  def get_answer
    print ">> "
    gets.chomp
  end

  def reset
    @lives = 3
    @score = 0
  end
end