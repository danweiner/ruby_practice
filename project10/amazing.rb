# A mazeike treasure search game
# To run the program, use ruby amazing.rb

require 'gosu'

class Amazing < Gosu::Window
  def initialize
    super(640, 640)
    self.caption = "Amazing"
  end
end

window = Amazing.new
window.show