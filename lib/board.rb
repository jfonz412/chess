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
    board
  end
end