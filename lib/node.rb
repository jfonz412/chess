class Node
  attr_reader :x,:y
  attr_accessor :piece
  
  def initialize(x,y,piece = nil)
    @x = x
    @y = y
    @piece = piece
  end

  public
  def validate_piece(color)
    return false if @piece == nil
    return false unless @piece.color == color
    true
  end

end
