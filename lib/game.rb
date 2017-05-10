require './lib/player.rb'
require './lib/node.rb'
require './lib/piece.rb'
require './lib/board.rb'


# GAME INTRODUCTION
puts "Player 1 (white), please enter your name:\n"
name = gets.chomp
player_white = Player.new(name,"white")

puts "Player 2 (black), please enter your name:\n"
name = gets.chomp
player_black = Player.new(name,"black")
puts

chess_board = Board.new
p chess_board.squares
# Main game loop
#loop do
  loop do

  	puts "#{player_white.name} (#{player_white.color}), it is your move!\n"
  	puts "Enter to X coordinate of the piece you want to move\n"
    target_x = gets.chomp.to_i
    puts "Now enter the Y coordinate of the piece you want to move\n"
    target_y = gets.chomp.to_i
    puts

    if chess_board.find_square(target_x,target_y,"white") == true
      puts "----------\n(Enter two invalid coordinates to select a different piece\n----------\n"

      puts "Enter the X coordinate of the square you want to move to:\n"
      target_x = gets.chomp.to_i
      puts "Now enter the Y coordinate of the square you want to move to\n"
      target_y = gets.chomp.to_i

      break if chess_board.move_piece(target_x,target_y) == true
    end

  end
#end

p chess_board.squares

