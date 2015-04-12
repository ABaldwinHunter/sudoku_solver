class Cell
  attr_accessor :index, :contents, :possibilities, :sudoku, :block
  attr_reader :board, :col, :row, :x_dim

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

  def determine!
    if possibilities && possibilities.length == 1
      self.contents = possibilities[0]
    end
  end

  def row
    index/x_dim
  end

  def col
    index % x_dim
  end

  def get_block
    sudoku.blocks.each_with_index do |block, i|
      if block.include?(self.index)
        self.block = i
      end
    end
  end

  def to_s
    contents || "-"
  end
end