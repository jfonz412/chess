require './lib/piece.rb'

class Pawn < Piece
  def check_moves(board = nil)
    pawn_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{2659}" : @symbol = "\u{265F}"
  end
end