class Player
  attr_reader :color, :lives
  attr_accessor :name

  class InvalidInputError < StandardError
  end

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
    begin
      print ">> "
      answer = gets.chomp
      raise InvalidInputError if invalid?(answer)
    rescue InvalidInputError
      get_answer
    end
    answer
  end

  def invalid?(answer)
    ( answer != "quit" && answer.to_i.to_s != answer ) || answer.empty?
  end

  def reset
    @lives = 3
    @score = 0
  end
end