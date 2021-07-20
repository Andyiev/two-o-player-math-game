#the main class to play the game
require_relative "players"
require_relative "question"

class Game
  def initialize
    @players = []
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players << @player1 #index 0
    @players << @player2 #index 1

    @current_player = rand(0...1)
    @winner = nil
    @game_status = "ongoing"
    puts "----------Start----------"

  end

  def start_game
    #if they have lives
    until @game_status == "ended"

      question = Question.new
      answer = question.answer

      puts "#{@players[@current_player].name}: #{question.ask_question}"
      playeranswer = gets.chomp.to_i
      check_answer(playeranswer, answer)
      
    end
  end

  def check_answer(playeranswer, answer)
    player = @players[@current_player]
    if answer == playeranswer
      puts "     Yes, that is correct!     "
    else
      puts "     No, this is not right!     "
     
      player.lose_life
      puts "\n----------Score Count----------"
      puts "Player 1: #{@players[0].lives}/3 vs. Player 2: #{@players[1].lives}/3 "
      #puts "\n----------New Turn----------"
    end
        
    if player.is_alive
    else
      puts "Sorry, you have no more lives"
      return end_game
    end
    change_player
  end

  def change_player
    if @current_player == 0 
      @current_player = 1
    else
      @current_player = 0
    end
    puts "\n----------New Turn----------"
  end

  def end_game
    @game_status = "ended"
    change_player
    puts "The winner is #{@players[@current_player].name} with a score #{@players[@current_player].lives}/3"
    puts "-----------Game Over-----------"
    puts "Good Bye!"
  end
end