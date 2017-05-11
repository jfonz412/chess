require './lib/piece.rb'

class Knight < Piece
  def check_moves(board = nil)
    knight_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{2658}" : @symbol = "\u{265e}"
  end
end