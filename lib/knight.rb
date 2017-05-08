require './lib/piece.rb'

class Knight < Piece
  def moves
    @moves = knight_moveset
  end
  def symbol
    @color == "white" ? @symbol = "\u{2658}" : @symbol = "\u{265e}"
  end
end