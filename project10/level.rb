require 'gosu'
require_relative 'tile'
require_relative 'player'

class Level

  def initialize(window, player, level_data)
    @window     = window
    @tiles      = []
    @player     = player
    @level_data = level_data
    @total_rows = 0
    @total_columns = 0
    @exit_reached  = false
    if @level_data
      @total_rows = @level_data.length
      if @total_rows > 0
        @total_columns = @level_data.first.length
      end
      setup_level
    end
  end

  def setup_level
    
  end

  def button_down(id)
    
  end

  def update
    
  end

  def draw
    
  end
end