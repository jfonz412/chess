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

    conext "square exists and piece is valid" do
      it "returns true" do
        expect(subject.find_square(2,1,"white")).to be true
      end
    end
  end
end

