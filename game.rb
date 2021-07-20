#the main class to play the game
require_relative "players"
require_relative "question"

class Game
  def initialize
    @players = [Player.new("Player1"), Player.new("Player2")]
    @player1 = @players[0]
    @player2 = @players[1]
    @current_player = @players[rand(0...1)]
    @winner = nil
    @is_complete = false
    puts "----------Start----------"
  end

  def start_game
    #if they have lives
    until @is_complete
      question = Question.new
      answer = question.answer
      puts "#{@current_player.name}: #{question.ask_question}"
      playeranswer = gets.chomp.to_i
      check_answer(playeranswer, answer)
      end
  end

  def check_answer(playeranswer, answer)
    if answer == playeranswer
      puts "     Yes, that is correct!     "
    else
      puts "     No, this is not right!     "
      @current_player.lose_life
      puts "\n----------Score Count----------"
      puts "Player 1: #{@player1.lives}/3 vs. Player 2: #{@player2.lives}/3 "
    end
        
    if @current_player.is_alive
    else
      puts "Sorry, you have no more lives"
      return end_game
    end
    change_player
  end

  def change_player
    if @current_player == @player1 
      @current_player = @player2
    else
      @current_player = @player1
    end
    puts "\n----------New Turn----------"
  end

  def end_game
    @is_complete = true
    change_player
    puts "The winner is #{@current_player.name} with a score #{@current_player.lives}/3"
    puts "-----------Game Over-----------"
    puts "Good Bye!"
  end
end