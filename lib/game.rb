require './lib/player.rb'
require './lib/node.rb'
require './lib/piece.rb'
require './lib/board.rb'


# GAME INTRODUCTION
puts "Player 1 (white), please enter your name:"
name = gets.chomp
player_white = Player.new(name,"white")

puts "Player 2 (black), please enter your name:"
name = gets.chomp
player_black = Player.new(name,"black")

chess_board = Board.new

p chess_board.squares