require 'node'
require 'stringio'

describe Node do
  context "when initialized" do
  	let(:node) {Node.new(1,2)}
    it "contains it's cordinates and no piece by default" do
      expect(node.x).to eql(1)
      expect(node.y).to eql(2)
      expect(node.piece).to eql(nil)
    end
  end
end