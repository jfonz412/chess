class Node
  attr_reader :x,:y
  attr_accessor :piece
  
  def initialize(x,y,piece = nil)
    @x = x
    @y = y
    @piece = piece
  end

  public
  def validate_move(x,y)
    move_attempt = [x,y]

    # does this also call the method? if so, no need to update moveset...
    return false unless @piece.moves.include? move_attempt 

    # if the above passes, we change piece's coordinates to the target node
    @piece.x = x
    @piece.y = y
  end

  def validate_piece(color)
    if @piece == nil
      puts "There is no piece on this space...\n"
      return false 
    end
    if @piece.color != color
      puts "This is not your piece...\n"
      return false
    end
    true
  end

end
