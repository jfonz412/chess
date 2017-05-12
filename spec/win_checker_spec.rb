require 'win_checker'
require 'board'

describe KingScanner do
  describe ".scan_board" do

  	let(:board) {Board.new}
  	subject do
  	  KingScanner.new(board.squares)
  	end

  	context "both kings still present" do
  	  it "returns false" do
  	  	expect(subject.scan_board).to be false
  	  end
    end

=begin (instance_variable_set doesn't work...)

    context "one king is missing" do
      it "returns true" do
      	board.instance_variable_set(:@squares[3][0].piece,nil)
      	expect(subject.scan_board).to be true
      end
    end

=end
  end
end