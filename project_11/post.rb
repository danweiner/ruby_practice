require 'gosu'

class Post

  def initialize(window, x, y, width=40, height=400)
    @height = height
    @width  = width
    @x      = x
    @y      = y
    @color  = Gosu::Color.argb(0xaa0000ff)
    @window = window
    @discs  = []
  end

  def draw
    @window.draw_quad (
      @x, @y, @color,
      @x + @width, @y, @color,
      @x + @width, @y + @height, @color,
      @x, @y + @height, @color
      )
  end
end