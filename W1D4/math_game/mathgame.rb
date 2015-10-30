class MathGame
  def initialize
    @solution = 0
    @player1 = Player.new(:blue)
    @player2 = Player.new(:cyan)
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
    playing = true

    while playing
      generate_question
      check_answer(get_player_answer)

      if game_over?
        puts "GAME OVER"
        switch_players
        show_winner
        if replay?
          reset_stats
        else
          playing = false
        end
      else
        show_scores
        switch_players
      end
    end
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
    operator = generate_operator

    puts_color("#{@current_player.name}: What is #{num1} #{operator} #{num2} ?", @current_player.color)
    calculate_solution(num1, num2, operator)
  end

  def calculate_solution(num1, num2, operator)
    case operator
    when "+"
      @solution = num1 + num2
    when "-"
      @solution = num1 - num2
    when "*"
      @solution = num1 * num2
    end
  end

  def generate_operator
    operators = ['+', '-', '*']
    rand_operator_index = rand(operators.length)
    operator = operators[rand_operator_index]
  end

  def get_player_answer
    print ">> "
    gets.chomp.to_i
  end

  def check_answer(answer)
    if (@solution != answer)
      @current_player.minus_life
      puts_color("So close! The answer is #{@solution}", :red)
    else
      @current_player.add_score
      puts_color("Correct!", :green)
    end
  end

  def show_scores
    @player1.show_score
    @player2.show_score
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def show_winner
    put_color("The winner is #{@current_player.name.upcase}!!", :green)
    show_scores
  end

  def replay?
    puts "Want to play again? (y/n)"
    answer = gets.chomp.downcase
    answer.include?('y') || answer.include?('yes')
  end

  def puts_color(text, color)
    puts text.colorize(color)
  end
end