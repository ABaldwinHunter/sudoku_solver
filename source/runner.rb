require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 16 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

strings = File.readlines("sudoku_puzzles.txt").map {|string| string.chomp}
games = strings.map {|string| Sudoku.new(string)}

games.each_with_index do |game, i|
  if i > 3
    game.title = "SUDOKU PUZZLE #{i+1}"
    game.solve!
    sleep 1.0
  end
end

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp

# game = Sudoku.new(board_string)
# # game.solve
# puts game
# game.print_board
# game.solve!


