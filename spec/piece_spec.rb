require 'piece'
require 'knight'

describe Knight do 
  
  let(:knight) { Knight.new("Knight","white",1,0) }

  context "when initialized" do

    it "should inherit from Piece" do
      expect(knight).to respond_to(:name)
      expect(knight).to respond_to(:color)
      expect(knight).to respond_to(:x)
      expect(knight).to respond_to(:y)
    end

    it "should have it's own moveset/symbol" do
      expect(knight).to respond_to(:moves)
      expect(knight).to respond_to(:symbol)
      expect(knight.moves[0]).to eql([0,2])
    end

  end
end