require 'gosu'
require_relative 'grid'
require_relative 'cell'

class Game
  GENERATION_FREQUENCY = 100 # in milliseconds
  SEED_BLINKER  = [[11,10],[11,11],[11,12]]
  SEED_LIST     = [SEED_BLINKER]
  GRID_WIDTH    = 80
  GRID_HEIGHT   = 80

  def initialize(window, generations, sim)
    @window   = window
    seed      = SEED_LIST[sim - 1]
    @grid     = Grid.new(@window, GRID_WIDTH, GRID_HEIGHT, seed)
    @font     = Gosu::Font.new(12)  
    @time_now = @time_start = Time.now.to_i
    @last_update  = 0
    @generation   = 0
    @max_generations = generations.to_i
    @status_message = "Completed"
  end

  def simulation_over?
    (@max_generations > 0) && (@generation >= @max_generations)
  end

  def update
    
  end

  def draw
    @grid.draw
  end
end