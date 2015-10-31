class MathGame

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play
    reset_stats
    while !game_over?
      turn = Turn.new(@current_player)
      turn.play
      switch_players unless game_over?
    end
    determine_winner
  end

  private 

  def determine_winner
    puts "GAME OVER".colorize(:light_yellow)
    winner = (@player1.lives == 0) ? @player2 : @player1
    puts "The winner is #{winner.name.upcase}!".upcase.colorize(:light_yellow).on_black
    show_scores
  end

  def reset_stats
    @player1.reset
    @player2.reset
  end

  def game_over?
    @current_player.dead?
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
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end