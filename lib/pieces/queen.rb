require './lib/piece.rb'

class Queen < Piece
  def check_moves(board = nil)
    queen_moveset(board)
  end
  # re-write so method isn't called everytime
  def symbol
    @color == "white" ? @symbol = "\u{2655}" : @symbol = "\u{265B}"
  end
end