class Node
  attr_reader :x,:y
  attr_accessor :piece
  
  def initialize(x,y,piece = nil)
    @x = x
    @y = y
    @piece = piece
  end

  public
  def validate_move(x,y,board)
    move_attempt = [x,y]

    return false unless @piece.check_moves(board).include? move_attempt 

    # if the above passes, we change piece's coordinates to the target node
    @piece.x = x
    @piece.y = y
  end

  def validate_piece(color)
    if @piece == nil
      puts "There is no piece on this space...\n"
      return false

    elsif @piece.color != color
      puts "This is not your piece...\n"
      return false
    end
    
    true
  end

end
