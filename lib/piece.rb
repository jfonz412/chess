require './lib/movesets.rb'

class Piece
  attr_reader :name, :color, :moves
  attr_accessor :x,:y

  include Movesets

  def initialize(name, color)
  	@name = name # names will be capitalized
  	@color = color # colors will not
    @x = nil
    @y = nil
  end
end