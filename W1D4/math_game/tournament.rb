class Tournament
  def initialize
    @player1 = Player.new(:light_white)
    @player2 = Player.new(:light_magenta)
  end

  def get_names
    puts "Player 1: What is your name?".colorize(@player1.color).on_black
    @player1.name = gets.chomp
    puts "Player 2: What is your name?".colorize(@player2.color).on_black
    @player2.name = gets.chomp
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

end