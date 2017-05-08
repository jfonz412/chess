require 'board'

describe Board do
  context "when initialized" do
    it "creates an 8x8 array full of Nodes" do
      expect(subject.squares[7][7]).to be_instance_of(Node)
    end
  end

  context "after board is created" do
  	it "populates to board with pieces" do
  	  expect(subject.squares[0][0].piece).to be_kind_of(Piece)
  	end
  end
end

