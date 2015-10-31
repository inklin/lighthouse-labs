class Player
  attr_reader :color, :lives
  attr_accessor :name

  def initialize(color)
    @name = ""
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
    puts "#{@name}'s remaining lives: #{@lives}"
  end

  def get_answer
    print ">> "
    gets.chomp.to_i
  end

  def reset
    @lives = 3
    @score = 0
  end
end