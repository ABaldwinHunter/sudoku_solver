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

    it "initializes with @impossible board as nil" do
      expect(easy_game.impossible_board).to be(nil)
    end



  end

#board dimensions - array indices

  describe "#rows" do
    let(:rows) {easy_game.rows}
    it "returns an array" do
      expect(rows).to be_an_instance_of(Array)
    end

    it "returns an array with 9 elements" do
      expect(rows.length).to eq(9)
    end

    it "returns an array with nested subarrays" do
      expect(rows[0]).to be_an_instance_of(Array)
    end

    it "returns rows with length 9" do
      row = rows[rand(9)]
      expect(row.length).to eq(9)
    end

    it "has subarrays of indices in range n..n+8" do
      row = rows[rand(9)]
      expect(row[8] - row[0]).to eq(8)
    end

    it "has subarrays containing numbered indices of board 0-80" do
      flattened = rows.flatten
      expect(flattened).to eq([*0..80])
    end
  end

  describe "#cols" do
  end

  describe "#blocks" do
  end


end