class MathGame
  attr_accessor :current_player, :solution

  def initialize
    @solution = 0
    @player1 = Player.new(:light_white)
    @player2 = Player.new(:light_magenta)
    @current_player = @player1
  end

  def start_game
    get_names
    play
  end

  def get_names
    puts_color("Player 1: What is your name?", @player1.color)
    @player1.name = gets.chomp
    puts_color("Player 2: What is your name?", @player2.color)
    @player2.name = gets.chomp
  end

  def play
    while !game_over?
      generate_question
      check_answer(get_player_answer)
      switch_players unless game_over?
    end
    show_final_stats
    play if replay?
  end

  def show_final_stats
    puts_color("GAME OVER", :light_yellow)
    determine_winner
  end

  def determine_winner
    winner = (@player1.lives == 0) ? @player2 : @player1
    puts_color("The winner is #{winner.name.upcase}!".upcase, :light_yellow)
    show_scores
  end

  def reset_stats
    @player1.lives = 3
    @player2.lives = 3
    @player1.score = 0
    @player2.score = 0
  end

  def game_over?
    @current_player.dead?
  end

  def generate_question
    number_limit = 20
    num1 = rand(number_limit)
    num2 = rand(number_limit)
    operator = [:+, :-, :*].sample
    calculate_solution(num1, num2, operator)

    puts_color("#{@current_player.name}: What is #{num1} #{operator} #{num2} ?", @current_player.color)
  end

  def calculate_solution(num1, num2, operator)
    self.solution = num1.send(operator, num2)
  end

  def get_player_answer
    print ">> "
    gets.chomp.to_i
  end

  def check_answer(answer)
    if (@solution != answer)
      @current_player.minus_life
      puts_color("So close! The answer is #{@solution}", :light_red)
      show_lives
    else
      @current_player.add_score
      puts_color("Correct!", :light_green)
    end
  end

  def show_scores
    @player1.show_score
    @player2.show_score
  end

  def show_lives
    @player1.show_life
    @player2.show_life
  end

  def switch_players
    if self.current_player == @player1
      self.current_player = @player2
    else
      self.current_player = @player1
    end
  end

  def replay?
    puts_color("Want to play again? (y/n)", :light_yellow)
    gets.chomp.downcase == "y"
  end

  def puts_color(text, color)
    puts text.colorize(color).on_black
  end
end