# initialize player1 score to zero
# initialize player2 score to zero

# start game

# set current player to player 1

# play until game over
#   generate question
#   print question
#   get player answer
#   evaluate player answer
#   if answer is wrong
#     subtract life from current player
#     if current player dead?
#       print other player score
#       print other player as winner
#       game over
#     else
#       show both player scores
#     end
#   end
#   switch player
# end

class MathGame
  def initialize
    @solution = 0
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start_game
    get_names
    play
  end

  def get_names
    puts "#{@player1.name}: What is your name?"
    @player1.name = gets.chomp
    puts "#{@player2.name}: What is your name?"
    @player2.name = gets.chomp
  end

  def play
    playing = true

    while playing
      generate_question
      answer = get_player_answer

      if answer_wrong?(answer)
        @current_player.minus_life
      else
        @current_player.add_score
      end

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

    puts "#{@current_player.name}: What is #{num1} #{operator} #{num2} ?"
    calculate_solution(num1, num2, operator)
    #puts "The solution is #{@solution}"
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

  def answer_wrong?(answer)
    @solution != answer
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
    puts "The winner is #{@current_player.name.upcase}!!"
    show_scores
  end

  def replay?
    puts "Want to play again? (y/n)"
    answer = gets.chomp.downcase
    answer.include?('y') || answer.include?('yes')
  end
end

class Player
  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
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

end



new_game = MathGame.new()
new_game.start_game