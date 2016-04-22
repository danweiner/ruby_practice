require 'gosu'

class Tile
  PLAYER_TYPE   = 'P'
  START_TYPE    = 'S'
  EXIT_TYPE     = 'E'
  TREASURE_TYPE = 'T'
  EMPTY_TYPE    = '.'
  WIDTH         = 32
  HEIGHT        = 32

  attr_reader :row, :column, :type

  def initialize(window, column, row, type)
    @@colors ||= {red: Gosu::Color.argb(0xaaff0000), 
                  green: Gosu::Color.argb(0xaa00ff00), 
                  gold: Gosu::Color.argb(0xaaffff00), 
                  blue: Gosu::Color.argb(0xaa0000ff)}
    @@font ||= Gosu::Font.new(24)
    @@window ||= window
    @row    = row
    @column = column
    @type   = type
    @hidden = false
  end

  def draw
    
  end
end