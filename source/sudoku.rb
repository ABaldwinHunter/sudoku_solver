require_relative 'cell'
require 'byebug'

class Sudoku
  attr_accessor :board, :possibilities, :blocks, :impossible_board, :title, :changed_this_round
  attr_reader :x_dim, :board_string

  def initialize(board_string)
    @title
    @board_string = board_string
    @board = []
    @blocks
    @x_dim = 9
    @impossible_board
    @changed_this_round = 0
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

  def check_possibilities(cell)
    possibilities_before = cell.possibilities.length
    check_rows(cell)
    check_cols(cell)
    check_blocks(cell)
    possibilities_after = cell.possibilities.length
    self.changed_this_round += 1 if possibilities_after < possibilities_before
    if cell.possibilities && cell.possibilities.length == 0
      self.impossible_board = true
      puts "checked possibilities, impossible board!"
      # sleep 0.5
    end
  end

  def check_rows(cell)
    rows[cell.row].each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def check_cols(cell)
    cols[cell.col].each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def check_blocks(cell)
    blocks[cell.block].each do |index|
      cell.possibilities.delete(board[index].contents)
    end
  end

  def solved?
    !self.to_s.include?("-")
  end

  def induction_failed?
    return false if solved?
    changed_this_round == 0
  end

  def reset_board!
    p "resetting!"
    # sleep 0.5
    self.board = []
    self.impossible_board = false
    self.initialize_cells!(board_string)
    p "re-initialized board"
  end

  def solve!
    self.changed_this_round = 0
    if solved?
      print_board
      puts "DONE!"
      sleep 1.0
      return true
    else
      board.each do |cell|
        if !cell.contents
          check_possibilities(cell)
          if cell.possibilities && cell.possibilities.length == 1
            cell.determine!
            # print_board
            # clear_screen!
          end
        end
      end
      if impossible_board
        p "impossible board!"
        # sleep 0.5
        reset_board!
      elsif induction_failed?
        p "induction_failed!"
        # sleep 0.5
        guess
      end
    solve!
    end
  end

  def guess
    board.each do |cell|
      if !cell.contents
        cell.possibilities = [cell.possibilities.sample] #guess random possibility
        puts "possibilities = #{cell.possibilities}"
        puts "guessing #{cell.possibilities[0]}"
        # sleep 0.5
        cell.determine!
        return
      end
     end
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    board.map {|cell| cell.to_s }.join("")
  end

  def print_board
    puts title
    board.each_slice(27) do |chunk|
      puts "-------------------------"
      chunk.each_slice(9) do |row|
        print "| "
        row.each_slice(3) do |third|
          third.each do |cell|
            print cell.to_s + " "
          end
          print "| "
        end
        print "\n"
      end
    end
    puts "-------------------------"
  end

  def clear_screen!
    sleep 0.15
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
