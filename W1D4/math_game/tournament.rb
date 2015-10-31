class Tournament
  def initialize
    @player1 = Player.new("1", :light_white)
    @player2 = Player.new("2", :light_magenta)
  end

  def get_names
    get_name(@player1)
    get_name(@player2)
  end

  def start
    get_names
    replay = true
    while replay
      @game = MathGame.new(@player1, @player2)
      @game.play
      replay = replay?
    end
  end

  def replay?
    puts "Want to play again? (y/n)".colorize(:light_yellow).on_black
    gets.chomp.downcase == "y"
  end

  def get_name(player)
    puts "Player #{player.name}: What is your name?".colorize(player.color).on_black
    player.name = gets.chomp
  end

end