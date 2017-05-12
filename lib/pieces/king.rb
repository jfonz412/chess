require './lib/piece.rb'

class King < Piece
  def check_moves(board = nil)
    king_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{2654}" : @symbol = "\u{265A}".colorize(:black)
  end
end