require './lib/pieces/knight.rb'

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
    return false if check_friendly_fire(x,y) == false
    return false if @starting_square.validate_move(x,y,@squares) == false

    @target_square = squares[x][y]

    @target_square.piece = @starting_square.piece
    @starting_square.piece = nil

    true
  end

  private
  def check_friendly_fire(x,y)
    unless squares[x][y].piece.nil?
      return false if @starting_square.piece.color == squares[x][y].piece.color
    end
  end


  def validate_square(x,y)
    unless x.between?(0,7) && y.between?(0,7)
      puts "Invalid entry, please try again.\n"
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

    return board
  end
end