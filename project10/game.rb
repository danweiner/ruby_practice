require 'gosu'
require_relative 'level'
require_relative 'player'

class Game
  LEVEL1 = []

  def initialize(window)
    @window     = window
    @player     = Player.new(@window, 0, 0)
    @level      = Level.new(@window, @player, LEVEL1)
    @font       = Gosu::Font.new(32)
    @time_start = Time.now.to_i
  end

  def button_down(id)
    
  end

  def update
    
  end

  def draw
    
  end
end