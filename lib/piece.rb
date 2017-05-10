require './lib/movesets.rb'

class Piece
  attr_reader :name, :color, :symbol, :moves
  attr_accessor :x,:y

  include Movesets

  def initialize(name, color, x, y)
  	@name = name # names will be capitalized
  	@color = color # colors will not
    @x = x
    @y = y
  end
end