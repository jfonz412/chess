module Movesets

  def knight_moveset
    moves = [
		      [@x - 1, @y + 2], 
		      [@x + 1, @y + 2],
		      [@x + 2, @y + 1],
		      [@x + 2, @y - 1],
		      [@x + 1, @y - 2],
		      [@x - 1, @y - 2],
		      [@x - 2, @y - 1],
		      [@x - 2, @y + 1]
		   ]

    # Remove illegal moves
    moves.delete_if {|x_y| true if x_y[0] < 0 || x_y[1] < 0}
    moves.delete_if {|x_y| true if x_y[0] > 7 || x_y[1] > 7}
  end

  def castle_moveset(board)
  	moves = []

  	moves = move_north(moves,board)
  	moves = move_south(moves,board)
  	moves = move_east(moves,board)
  	moves = move_west(moves,board)

  end	


# Functions for castle/bishop/queen
  def move_east(moves,board)
  	x = @x
  	y = @y
  	n = 0

  	loop do
      n += 1
      break if board[x + n].nil?

      if board[x + n][y].piece == nil
        moves << [x + n, y]

      elsif board[x + n][y].piece.color == @color
      	break

      else
        moves << [x + n, y]
        break
      end
  	end

    moves
  end

  def move_west(moves,board)
  	x = @x
  	y = @y
  	n = 0

  	loop do
      n += 1
      break if board[x - n].nil?

      if board[x - n][y].piece == nil
        moves << [x - n, y]

      elsif board[x - n][y].piece.color == @color
      	break

      else
        moves << [x - n, y]
        break
      end
  	end

    moves
  end

  def move_south(moves,board)
  	x = @x
  	y = @y
  	n = 0

  	loop do
      n += 1
      break if board[x][y - n].nil?

      if board[x][y - n].piece == nil
        moves << [x, y - n]

      elsif board[x][y - n].piece.color == @color
      	break

      else
        moves << [x, y - n]
        break
      end
  	end

    moves
  end

  def move_north(moves,board)
  	x = @x
  	y = @y
  	n = 0

  	loop do
      n += 1
      break if board[x][y + n].nil?

      if board[x][y + n].piece == nil
        moves << [x, y + n]

      elsif board[x][y + n].piece.color == @color
      	break

      else
        moves << [x, y + n]
        break
      end
  	end

    moves
  end

end