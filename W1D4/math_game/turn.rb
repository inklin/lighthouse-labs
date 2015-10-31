class Turn

  def initialize(player)
    @player = player
  end

  def play
    @question = Question.new
    puts "#{@player.name}: #{@question.get_question}".colorize(@player.color).on_black
    answer = @player.get_answer

    if @question.correct?(answer)
      @player.add_score
      puts "Correct!".colorize(:light_green).on_black
    else
      @player.minus_life
      puts "So close! The answer is #{@question.solution}".colorize(:light_red).on_black
    end
  end

end