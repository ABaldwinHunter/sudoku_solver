require_relative 'cell'

class Sudoku
  attr_accessor :board

  def initialize(board_string)
    @board = board_string.split("")
  end

  def rows
    (0..80).each_slice(9).map {|a| a}
  end

  def cols
    rows.transpose
  end

  def blocks
    block_corners = [0, 3, 6, 27, 30, 33, 54, 57, 60]
    block_corners.map {|i| [i, i+1, i+2, i+9, i+10, i+11, i+18, i+19, i+20]}
  end

  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


