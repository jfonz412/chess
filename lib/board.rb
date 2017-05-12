require './lib/pieces/knight.rb'
require './lib/pieces/castle.rb'
require './lib/pieces/bishop.rb'
require './lib/pieces/queen.rb'
require './lib/pieces/king.rb'
require './lib/pieces/pawn.rb'

class Board
  attr_reader :squares

  def initialize
    @squares = create_board
    @starting_square = nil
    @target_square = nil
  end

  public
  def find_square(x,y,color)
    x = x.to_i - 1   
    y = y.to_i - 1

    return false if validate_square(x,y) == false
    return false if @squares[x][y].validate_piece(color) == false

    @starting_square = @squares[x][y]

    true
  end

  def move_piece(x,y)
    x = x.to_i - 1   
    y = y.to_i - 1

    return false if validate_square(x,y) == false
    
    if @starting_square.validate_move(x,y,@squares) == false
      puts "Invalid move...try again\n"
      return false 
    end

    @target_square = squares[x][y]

    @target_square.piece = @starting_square.piece
    @starting_square.piece = nil
    @target_square.piece.first_move = false # for pawns

    true
  end

  private
  def validate_square(x,y)
    unless x.between?(0,7) && y.between?(0,7)
      puts "Stay on the (8x8) board!\n"
      return false
    end
  end

  def create_board
    board = []

    for x in 0..7
      board[x] = []
      for y in 0..7
  	    board[x] << Node.new(x,y)
      end
    end
    board = populate_board(board)
  end

  def populate_board(board)
    board[1][0].piece = Knight.new("Knight","white",1,0)
    board[6][0].piece = Knight.new("Knight","white",6,0)
    board[1][7].piece = Knight.new("Knight","black",1,7)
    board[6][7].piece = Knight.new("Knight","black",6,7)

    board[0][0].piece = Castle.new("Castle","white",0,0)    
    board[7][0].piece = Castle.new("Castle","white",7,0)
    board[0][7].piece = Castle.new("Castle","black",0,7)
    board[7][7].piece = Castle.new("Castle","black",7,7)

    board[2][0].piece = Bishop.new("Bishop","white",2,0)
    board[5][0].piece = Bishop.new("Bishop","white",5,0)
    board[2][7].piece = Bishop.new("Bishop","black",2,7)
    board[5][7].piece = Bishop.new("Bishop","black",5,7)

    board[4][0].piece = Queen.new("Queen","white",4,1)
    board[4][7].piece = Queen.new("Queen","black",4,7)

    board[3][0].piece = King.new("King","white",3,0)
    board[3][7].piece = King.new("King","black",3,7)

    for n in 0..7
      board[n][1].piece = Pawn.new("Pawn","white",n,1)
    end

    for n in 0..7
      board[n][6].piece = Pawn.new("Pawn","black",n,6)
    end

    return board
  end
end