#this file is only responsible for starting the game
require_relative "players"
require_relative "question"
require_relative "game"

game = Game.new

game.start_game