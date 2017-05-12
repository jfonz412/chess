class Draw
  attr_reader :board

  def initialize(board)
    @board = board
  end

  public
  def draw_board

    7.downto(0) do |x|
  	  for y in 0..7

  	    if board[y][x].piece == nil
  	      print " "
  	    else
  	      print "#{board[y][x].piece.symbol} "
  	    end

      end
      puts
    end

  end

end