require './lib/player.rb'
require './lib/node.rb'
require './lib/piece.rb'
require './lib/board.rb'
require './lib/draw.rb'
require './lib/win_checker.rb'
require 'colorize'

# GAME INTRODUCTION
puts "Player 1 (white), please enter your name:\n".colorize(:blue)
name = gets.chomp
player_white = Player.new(name,"white")

puts "\nPlayer 2 (black), please enter your name:\n".colorize(:green)
name = gets.chomp
player_black = Player.new(name,"black")
puts

chess_board = Board.new

scanner = KingScanner.new(chess_board.squares)
draw = Draw.new(chess_board.squares)

draw.draw_board
#p String.color_samples
# Main game loop
loop do
  loop do
  	puts "\n\n#{player_white.name} (WHITE), it is your move!\n".colorize(:blue)
  	puts "Enter the LETTER of the piece you want to move\n"
    target_x = gets.chomp
    puts "Now enter the number of the piece you want to move\n"
    target_y = gets.chomp.to_i
    puts

    if chess_board.find_square(target_x,target_y,"white") == true
      puts "----------\n(Enter two invalid coordinates to select a different piece)\n----------\n".colorize(:blue)

      puts "Enter the letter of the square you want to move to:\n"
      target_x = gets.chomp
      puts "Now enter the number of the square you want to move to\n"
      target_y = gets.chomp.to_i
      puts
      break if chess_board.move_piece(target_x,target_y) == true
    end
  end
  
  draw.draw_board
  break if scanner.scan_board == true

  loop do
  	puts "\n\n#{player_black.name} (BLACK), it is your move!\n".colorize(:green)
  	puts "Enter to letter of the piece you want to move\n"
    target_x = gets.chomp
    puts "Now enter the number of the piece you want to move\n"
    target_y = gets.chomp.to_i
    puts

    if chess_board.find_square(target_x,target_y,"black") == true
      puts "----------\n(Enter two invalid coordinates to select a different piece)\n----------\n".colorize(:blue)

      puts "Enter the letter of the square you want to move to:\n"
      target_x = gets.chomp
      puts "Now enter the number of the square you want to move to\n"
      target_y = gets.chomp.to_i
      puts
      break if chess_board.move_piece(target_x,target_y) == true
    end
  end
  
  draw.draw_board
  break if scanner.scan_board == true
end

puts
puts "CHECK MATE!!!\nGAME OVER!!!"
