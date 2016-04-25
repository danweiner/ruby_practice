require 'gosu'
require_relative 'cell'

class Grid
  include Enumerable

  def initialize(window, columns, rows, seeds=nil)
    @window   = window
    @total_rows = rows
    @total_columns = columns
    @board = setup_grid
    plant_seeds(@board, seeds)
  end

  def setup_grid
    grid = []
    @total_rows.times do |row|
      cells = []
      @total_columns.times do |col|
        cells << Cell.new(@window, false, col, row)
      end
      grid << cells
    end
    grid
  end

  def plant_seeds(board, seeds)
    if seeds.nil? || seeds.empty?
      40.times do
        board[rand(@total_rows)][rand(@total_columns)].live!
      end
    else
      seeds.each do |x, y|
        cell(x, y).live!
      end
    end
  end

  def cell(x, y)
    if @board[y]
      @board[y][x]
    else
      nil
    end
  end

  def draw
    
  end
end