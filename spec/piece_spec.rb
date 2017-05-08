require 'piece'
require 'knight'

describe Knight do 
  
  let(:knight) { Knight.new("Knight","white","\u{2658}") }

  before do 
  	knight.x = 1
  	knight.y = 2
  end

  context "when initialized" do

    it "should inherit from Piece" do
      expect(knight).to respond_to(:name)
      expect(knight).to respond_to(:color)
      expect(knight).to respond_to(:symbol)
      expect(knight).to respond_to(:x)
      expect(knight).to respond_to(:y)
    end

    it "should have it's own moveset" do
      expect(knight).to respond_to(:moves)
      expect(knight.moves[0]).to eql([0,4])
    end

  end
end