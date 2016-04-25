require 'gosu'
require_relative 'disc'
require_relative 'post'

class Game
  POST_TOP    = 150
  POST_LEFT   = 120
  POST_GAP    = 240
  POST_WIDTH  = 40
  POST_HEIGHT = 400
  NUM_DISCS   = 5

  def initialize(window)
    @window     = window
    @font       = Gosu::Font.new(32)
    @time_start = Time.now.to_i
    @posts      = []
    @discs      = []
    initialize_posts
    initialize_discs
    @current_disc = nil
    @move_count = 0
  end

  def initialize_posts
    0.upto(2) do |index|
      @posts << Post.new(@window,
                    POST_LEFT + (index * POST_GAP),
                    POST_TOP,
                    POST_WIDTH,
                    POST_HEIGHT)
    end
  end

  def initialize_discs
    first_post = @posts.first 
    0.upto(NUM_DISCS - 1) do |index|
      disc = Disc.new(@window, index, first_post)
      @discs << disc
    end
  end

  def draw
    @posts.each {|post| post.draw}
    @discs.each {|disc| disc.draw}
    @font.draw("Move tower from left to rignt most post", 4, 2, 10)
    @font.draw("Moves: #{@move_count}", 640, 2, 10)
  end
end