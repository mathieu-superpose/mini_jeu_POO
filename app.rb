#require 'bundler'
#Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = HumanPlayer.new("José")

puts "Voici l'état de chaque joueur :"
puts player1.show_state
puts player2.show_state
puts "\n"

puts "Passons à la phase d'attaque :"
round = 1

while player1.life_points > 0 || player2.life_points > 0
	puts "Rounds #{round}"
	puts player2.attacks(player1)
	abort("Fin de la partie!") if (player1.life_points <= 0)
	puts player1.attacks(player2)
	abort("Fin de la partie!") if (player2.life_points <= 0)
	puts "Fin du rounds #{round}, voici l'état de chaque joueur :"
	puts player1.show_state
	puts player2.show_state
	puts "\n"
	round += 1
end

binding.pry
