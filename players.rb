# player class with a name, a number of lives, live countdown, "is alive" variable

class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def is_alive
    @lives > 0
  end

end