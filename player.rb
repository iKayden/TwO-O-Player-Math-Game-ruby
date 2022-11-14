class Player
  attr_reader :name
  attr_accessor :lives, :turn

  def initialize(name)
    @name = name
    @lives = 3
    @turn = false
  end


end
