class Cell
  attr_accessor :index, :contents, :determined, :possibilities
  attr_reader :board, :col, :row, :block

  def initialize(args)
    @index = args[:index]
    @contents = args[:contents] || nil
    @determined
    @possibilities
    @board = args[:board]
    @x_dim = board.x_dim || 9
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