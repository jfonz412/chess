class KingScanner
  def initialize(board)
  	@board = board
  end

  def scan_board
  	kings = 0

  	@board.each do |row|
  	  row.each do |square|
        kings += 1 if square.piece.is_a? King 
  	  end
  	end
    kings == 2 ? false : true
  end
end