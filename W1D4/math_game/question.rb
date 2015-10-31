class Question
  attr_reader :solution
  
  def initialize
    @num1 = rand(20)
    @num2 = rand(20)
    @operator = [:+, :-, :*].sample
    @solution = @num1.send(@operator, @num2)
  end

  def get_question
    "What is #{@num1} #{@operator} #{@num2} ?"
  end

  def correct?(answer)
    answer == @solution
  end

end