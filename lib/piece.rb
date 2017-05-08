require './lib/movesets.rb'

class Piece
  attr_reader :name, :color, :symbol, :moves
  attr_accessor :x,:y

  include Movesets

  def initialize(name, color, symbol)
  	@name = name # names will be capitalized
  	@color = color # colors will not
  	@symbol = symbol
    @x = nil
    @y = nil
    @moves = nil
  end
end