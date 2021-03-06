module Movesets

  def knight_moveset(board)
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

    moves = remove_illegal_moves(moves,board)
  end

  def king_moveset(board)
    moves = []
    @color == "white" ? n = 1 : n = -1
    x = @x
    y = @y
    
    # moving forward 1 square
    unless board[x][y+n].nil?
      if board[x][y+n].piece.nil?
        moves << [x, y+n]
      elsif board[x][y+n].piece.color != @color
        moves << [x, y+n]
      end
    end

    # moving backwards one square
    unless board[x][y-n].nil?
      if board[x][y-n].piece.nil?
        moves << [x, y-n]
      elsif board[x][y-n].piece.color != @color
        moves << [x, y-n]
      end
    end

    # diagonal movement
    unless board[x + n].nil?
      unless board[x + n][y + n].nil?
        if board[x + n][y + n].piece.nil?
          moves << [x + n, y + n] 
        elsif board[x + n][y + n].piece.color != @color
          moves << [x + n, y + n]
        end
      end
    end

    unless board[x - n].nil?
      unless board[x - n][y + n].nil?
        if board[x - n][y + n].piece.nil?
          moves << [x - n, y + n] 
        elsif board[x - n][y + n].piece.color != @color
          moves << [x - n, y + n]
        end
      end
    end

    unless board[x - n].nil?
      unless board[x - n][y - n].nil?
        if board[x - n][y - n].piece.nil?
          moves << [x - n, y - n] 
        elsif board[x - n][y - n].piece.color != @color
          moves << [x - n, y - n]
        end
      end
    end

    unless board[x + n].nil?
      unless board[x + n][y - n].nil?
        if board[x + n][y - n].piece.nil?
          moves << [x + n, y - n] 
        elsif board[x + n][y - n].piece.color != @color
          moves << [x + n, y - n]
        end
      end
    end

  moves
  end

  def pawn_moveset(board)
    moves = []
    @color == "white" ? n = 1 : n = -1
    x = @x
    y = @y
    
    # moving forward 1 square
    unless board[x][y+n].nil?
      if board[x][y+n].piece.nil?
        moves << [x, y+n]
      end
    end
    
    # first move
    moves << [x, y + n*2] if @first_move == true

    # diagonal movement
    unless board[x + n].nil?
      unless board[x + n][y + n].nil?
        unless board[x + n][y + n].piece.nil?
          moves << [x + n, y + n] if board[x + n][y + n].piece.color != @color
        end
      end
    end

    unless board[x - n].nil?
      unless board[x - n][y + n].nil?
        unless board[x - n][y + n].piece.nil?
          moves << [x - n, y + n] if board[x - n][y + n].piece.color != @color
        end
      end
    end

  	moves
  end

  def castle_moveset(board)
  	moves = []

  	moves = move_north(moves,board)
  	moves = move_south(moves,board)
  	moves = move_east(moves,board)
  	moves = move_west(moves,board)

  end	

  def bishop_moveset(board)
    moves = []

    moves = diagonal_up_right(moves,board)
    moves = diagonal_up_left(moves,board)
    moves = diagonal_down_right(moves,board)
    moves = diagonal_down_left(moves,board)

  end

  def queen_moveset(board)
  	moves = []
    
    moves = diagonal_up_right(moves,board)
    moves = diagonal_up_left(moves,board)
    moves = diagonal_down_right(moves,board)
    moves = diagonal_down_left(moves,board)

  	moves = move_north(moves,board)
  	moves = move_south(moves,board)
  	moves = move_east(moves,board)
  	moves = move_west(moves,board)

  end

# Functions for castle/queen
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

  # Functions for bishop/queen
  def diagonal_up_right(moves,board)
  	x = @x
  	y = @y
  	n = 0
    
    loop do
      n += 1
  	  break if board[x + n].nil?
  	  break if board[x + n][y + n].nil?
  	  square = board[x + n][y + n]

  	  if square.piece == nil
  	  	moves << [x + n, y + n]

  	  elsif square.piece.color == @color
  	  	break

  	  else
  	  	moves << [x + n, y + n]
  	  end
  	end

    moves
  end

  def diagonal_up_left(moves,board)
  	x = @x
  	y = @y
  	n = 0
    
    loop do
      n += 1
  	  break if board[x - n].nil?
  	  break if board[x - n][y + n].nil?
  	  square = board[x - n][y + n]

  	  if square.piece == nil
  	  	moves << [x - n, y + n]

  	  elsif square.piece.color == @color
  	  	break

  	  else
  	  	moves << [x - n, y + n]
  	  end
  	end

    moves
  end

  def diagonal_down_right(moves,board)
  	x = @x
  	y = @y
  	n = 0
    
    loop do
      n += 1
  	  break if board[x + n].nil?
  	  break if board[x + n][y - n].nil?
  	  square = board[x + n][y - n]

  	  if square.piece == nil
  	  	moves << [x + n, y - n]

  	  elsif square.piece.color == @color
  	  	break

  	  else
  	  	moves << [x + n, y - n]
  	  end
  	end

    moves
  end

  def diagonal_down_left(moves,board)
  	x = @x
  	y = @y
  	n = 0
    
    loop do
      n += 1
  	  break if board[x - n].nil?
  	  break if board[x - n][y - n].nil?
  	  square = board[x - n][y - n]

  	  if square.piece == nil
  	  	moves << [x - n, y - n]

  	  elsif square.piece.color == @color
  	  	break

  	  else
  	  	moves << [x - n, y - n]
  	  end
  	end

    moves
  end

  def remove_illegal_moves(moves,board)

    # Remove illegal moves
    moves.delete_if {|x_y| true if x_y[0] < 0 || x_y[1] < 0}
    moves.delete_if {|x_y| true if x_y[0] > 7 || x_y[1] > 7}

    # Remove squares with friendly piece
    moves.delete_if do |x_y|
      x = x_y[0]
      y = x_y[1]

      unless board[x][y].piece.nil?
        board[x][y].piece.color == @color
      end
    end

    moves
  end

end