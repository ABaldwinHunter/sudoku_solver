require_relative 'cell'
require 'byebug'

class Sudoku
  attr_accessor :board, :possibilities, :blocks
  attr_reader :x_dim, :board_string

  def initialize(board_string)
    @board = []
    @blocks
    @x_dim = 9
    initialize_cells!(board_string)
  end

  def initialize_cells!(board_string)
    sudoku = self
    board_string.split("").each_with_index do |ele, i|
      cell = Cell.new(index: i, sudoku: sudoku)
      ele == "-" ? cell.possibilities = [*"1".."9"] : cell.contents = ele
      self.board << cell
    end
  end

  def rows
    (0..80).each_slice(9).map {|a| a}
  end

  def cols
    rows.transpose
  end

  def blocks
    return @blocks if @blocks
    block_corners = [0, 3, 6, 27, 30, 33, 54, 57, 60]
    blocks = block_corners.map {|i| [i, i+1, i+2, i+9, i+10, i+11, i+18, i+19, i+20]}
  end

  def check_rows(cell)
    rows(cell.row).each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def check_cols(cell)
    cols(cell.col).each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def check_blocks(cell)
    blocks(cell.block).each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def solve!
    board.each do |cell|
      if cell == 0

      end
    end
  end


  # Returns a nicely formatted string representing the current state of the board
  def to_s
    board.each do |cell|
      print cell.to_s
    end
  end

  def print_board
    board.each_slice(27) do |chunk|
      chunk.each_slice(9) do |row|
        row.each do |cell|
          print cell.to_s + " "
        end
        print "\n"
      end
    end
  end

  def clear_screen!
    print "\e[2J"
  end
end

  # 0   1   2   3  4  5   6   7   8
  # 9  10  11  12 13 14  15  16  17
  # 18 19  20  21 22 23  24  25  26

  # 27 28  29  30 31 32  33  34  35
  # 36 37  38  39 40 41  42  43  44
  # 45 46  47  48 49 50  51  52  53

  # 54 55  56  57 58 59  60  61  62
  # 63 64  65  66 67 68  69  70  71
  # 72 73  74  75 76 77  78  79  80
