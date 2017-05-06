require './lib/player.rb'

# GAME INTRODUCTION
puts "Player 1 (white), please enter your name:"
name = gets.chomp
player_white = Player.new(name,"white")

puts "Player 2 (black), please enter your name:"
name = gets.chomp
player_black = Player.new(name,"black")