require './lib/piece.rb'

class Knight < Piece
  attr_reader :moves
  
  def moves
    @moves = knight_moveset
  end
end