class Draw
  attr_reader :board

  def initialize(board)
    @board = board
  end

  public
  def draw_board

    for y in 0..7
  	  for x in 0..7

  	    if board[x][y].piece == nil
  	      print "  "
  	    else
  	      print " #{board[x][y].piece.symbol} "
  	    end

      end
      puts
    end

  end

end