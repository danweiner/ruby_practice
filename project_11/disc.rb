require 'gosu'

class Disc
  DISC_HEIGHT       = 30
  BASE_DISC_SIZE    = 40
  DISC_VERTICAL_GAP = 10

  attr_reader :number
  attr_accessor :post

  def initialize(window, number, starting_post)
    @window = window
    @number = number
    @height = DISC_HEIGHT
    @width  = BASE_DISC_SIZE * (@number + 1)
    @color  = Gosu::Color.argb(0xaaff00ff)
    @selected_color = Gosu::Color.argb(0xaaffeeff)
    @selected = false
    @x = 0
    @y = 0
    @post = starting_post
  end

  def draw
    @window.draw_quad(
      @x, @y, @color,
      @x + @width, @y, @color,
      @x + @width, @y + @height, @color,
      @x, @y + @height, @color
      )
  end
end