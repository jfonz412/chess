require './lib/movesets.rb'

class Piece
  attr_reader :name, :color, :symbol, :moves
  attr_accessor :x, :y, :first_move 

  include Movesets

  def initialize(name, color, x, y)
  	@name = name # names will be capitalized
  	@color = color # colors will not
    @x = x
    @y = y

    @first_move = true #for pawns
  end
end