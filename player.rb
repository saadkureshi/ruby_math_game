class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end
  
  def reduce_life
    @lives -= 1
  end

  def is_dead?
    @lives > 0 ? false : true
  end
end