require './lib/piece.rb'

class Bishop < Piece
  def check_moves(board = nil)
    bishop_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{265C}" : @symbol = "\u{265C}"
  end
end