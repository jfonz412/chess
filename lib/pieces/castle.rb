require './lib/piece.rb'

class Castle < Piece
  def check_moves(board = nil)
    castle_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{2656}" : @symbol = "\u{265C}".colorize(:black)
  end
end