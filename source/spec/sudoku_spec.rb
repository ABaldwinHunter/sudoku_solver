require 'rspec'
require_relative '../sudoku'

describe Sudoku do
  let(:easy_board) {"---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---"}
  let(:easy_game) {Sudoku.new(easy_board)}

  describe "#initialize" do
    it "initializes with a sudoku game object" do
      game = Sudoku.new(easy_board)
      expect(game).to be_an_instance_of(Sudoku)
    end

    it "creates a board array" do
      board = easy_game.board
      expect(board).to be_an_instance_of(Array)
    end

    it "has a board with 81 items" do
      expect(easy_game.board.length).to eq(81)
    end

    it "initializes with cell objects" do
      expect(easy_game.board[0]).to be_an_instance_of(Cell)
    end

    it "" do
    end
  end


end