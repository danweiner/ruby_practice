# Towers of Hanoi puzzle
# To run the program use:
# ruby tower.rb

require 'gosu'
require_relative 'game'

class Tower < Gosu::Window

  def initialize
    super(800, 600, false)
    self.caption = "Tower of Hanoi"
    @game = Game.new(self)
  end

end

window = Tower.new
window.show