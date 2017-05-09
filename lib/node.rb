class Node
  attr_reader :x,:y
  attr_accessor :piece
  
  def initialize(x,y,piece = nil)
    @x = x
    @y = y
    @piece = piece
  end

  public
  def move_piece
  	puts "Pick a square to move your #{@piece.name}(#{@piece.symbol} ) at #{@x+1},#{@y+1}\n"
  	puts "Enter REDO to pick a different piece\n"
  	input = gets.chomp
  	puts

  	return false if input.upcase == "REDO"
  end

  def validate_piece(color)
    if @piece == nil
      "There is no piece on this space..."
      return false 
    end
    if @piece.color != color
      puts "This is not your piece..."
      return false
    end
    true
  end

end
