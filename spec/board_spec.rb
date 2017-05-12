require 'board'

describe Board do
  context "when initialized" do
    it "creates an 8x8 array full of Nodes" do
      expect(subject.squares[7][7]).to be_instance_of(Node)
    end
  end

  context "after board is created" do
  	it "populates to board with pieces" do
  	  expect(subject.squares[1][0].piece).to be_kind_of(Piece)
  	end
  end

  describe ".find_square" do

    context "given non-integer input" do
      it "returns false" do
        expect(subject.find_square('a','z',"white")).to be false
        expect(subject.find_square('!','?',"white")).to be false
        expect(subject.find_square('ham','burgers',"white")).to be false
      end
    end

    context "square doesn't exist" do
      it "returns false" do
        expect(subject.find_square(9,9,"white")). to be false
        expect(subject.find_square(0,0,"white")). to be false
      end
    end

    context "square exists but piece nil or invalid" do
      it "returns false" do
        expect(subject.find_square(2,8,"white")).to be false
        expect(subject.find_square(4,4,"white")).to be false
      end
    end

    context "square exists and piece is valid" do
      it "returns true" do
        expect(subject.find_square(2,1,"white")).to be true
      end
    end
  end

  describe ".move_piece" do

    context "player wants to re-select piece" do
      it "returns false" do
        expect(subject.move_piece('redo','socks')).to be false
      end
    end

    context "square does not exist" do
      it "returns false" do
        expect(subject.move_piece(9,12)).to be false
      end
    end

    # At this point the piece's moves are considered
    let(:test_castle) {Board.new}
    before do
      test_castle.instance_variable_set(:@starting_square, test_castle.squares[7][7])
    end

    let(:test_bishop) {Board.new}
    before do
      test_bishop.instance_variable_set(:@starting_square, test_bishop.squares[2][7])
    end

    let(:test_queen) {Board.new}
    before do
      test_queen.instance_variable_set(:@starting_square, test_queen.squares[4][0])
    end

    let(:test_pawn) {Board.new}
    before do
      test_pawn.instance_variable_set(:@starting_square, test_pawn.squares[0][1])
    end

    context "square contains friendly piece" do
      it "returns false" do
        expect(test_castle.move_piece(7,8)).to be false
        #expect(test_bishop.move_piece(2,7)).to be false # needs pawn in front
        expect(test_queen.move_piece(6,8)).to be false
      end
    end
    
    context "square is valid, move is illegal" do
      it "returns false" do
        expect(test_castle.move_piece(7,7)).to be false
        expect(test_bishop.move_piece(3,4)).to be false
        expect(test_queen.move_piece(8,3)).to be false
        expect(test_pawn.move_piece(2,2)).to be false
      end
    end
    
    # can only move each piece once w/o resetting starting square
    context "square is valid, move is legal" do
      it "returns true" do
      	expect(test_pawn.move_piece(1,4)).to be true #first move
      	
        #expect(test_pawn.move_piece(1,5)).to be true
        # will pass if pawn not in front of it
        #expect(test_queen.move_piece(2,4)).to be true
        #expect(test_bishop.move_piece(8,3)).to be true
        #expect(test_castle.move_piece(8,5)).to be true 
      end
    end
  end
end

