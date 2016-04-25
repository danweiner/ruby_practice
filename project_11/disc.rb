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
    # Uses code from Post class
    starting_post.add_disc(self)
  end

  # Properly place the disc on top of the post in the correct stack position
  def draw
    if @post
      @x = @post.center - @width / 2
      position = @post.find_disc_position(self)
      if position
        if @selected
          c = @selected_color
        else
          c = @color
        end
        # Calculate the y position based on height of post
        @y = @post.base - @height - (position * (@height + DISC_VERTICAL_GAP))
        
        @window.draw_quad(
          @x, @y, c,
          @x + @width, @y, c,
          @x + @width, @y + @height, c,
          @x, @y + @height, c)
      end
    end
  end

  def toggle_selected
    @selected = !@selected
  end

  # Detect clicks inside the rectangle
  def contains?(mouse_x, mouse_y)
    mouse_x >= @x && mouse_x <= @x + @width && mouse_y >= @y && mouse_y <= @y + @height
  end
end