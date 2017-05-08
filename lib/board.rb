require './lib/knight.rb'

class Board
  attr_reader :squares

  def initialize
    @squares = create_board
  end

  private
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