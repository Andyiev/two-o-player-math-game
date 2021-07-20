# class to generate numbers from 1 to 20 to make math questions, with answers
class Question
  attr_reader :number1, :number2, :answer
  def initialize
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @answer = @number1 + @number2
  end

  def ask_question
    "What is sum of #{@number1} and #{@number2}?"
  end
end

