require './lib/piece.rb'

class Knight < Piece
  def moves
    @moves = knight_moveset
  end
end