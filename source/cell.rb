class Cell
  attr_accessor :index, :contents, :possibilities, :sudoku, :block
  attr_reader :board, :col, :row

  def initialize(args)
    @index = args[:index]
    @contents = args[:contents] || nil
    @possibilities
    @sudoku = args[:sudoku]
    @board = args[:board] || sudoku.board
    @x_dim = sudoku.x_dim || 9
    @block
    get_block
  end

  def row
    index % x_dim
  end

  def col
    index % x_dim
  end

  def get_block
    board.blocks.each_with_index do |block, i|
      if block.include?(self.index)
        self.block = i
      end
    end
  end

end