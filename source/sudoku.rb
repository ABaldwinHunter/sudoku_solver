require_relative 'cell'

class Sudoku
  attr_accessor :board

  def initialize(board_string)
    @board = board_string.split("")
  end



  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


