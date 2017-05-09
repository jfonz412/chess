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
    if @piece == nil
      "There is no piece on this space..."
      return false 
    end
    if @piece.color != color
      puts "This is not your piece..."
      return false
    end
    true
  end

end
