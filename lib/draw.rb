class Draw
  attr_reader :board

  def initialize(board)
    @board = board
  end

  public
  def draw_board
    black = true

    7.downto(0) do |x|
      print "#{x + 1} ".colorize(:yellow)
      print '|'
      black = !black
  	  for y in 0..7

  	    if board[y][x].piece == nil
          print "  |" if black == false
          print "##|" if black == true
          black = !black
  	    else
  	      print "#{board[y][x].piece.symbol} |"
          black = !black
  	    end

      end
      puts
    end
    puts
    print "   A  B  C  D  E  F  G  H".colorize(:yellow)
  end

end