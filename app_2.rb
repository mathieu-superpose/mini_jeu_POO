require 'pry'
require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player_2'

puts ""
puts "    -------------------------------------------------"
puts "    |           XXXXXXXX                            |"
puts "    |          XX      XX                 épisode 1 |"
puts "    |         X        X                            |"
puts "    |        XXXXXXXXXXX                            |"
puts "    |        X          XXXXX    XXXXX              |"
puts "    |       X         XX    XX XX    XX             |"
puts "    |       X         XX    XX XX    XX             |"
puts "    |                  XXXXXX   XXXXXX  v2.0a       |"
puts "    |                                               |"
puts "    | la guerre dans la maison de retraite!         |"
puts "    -------------------------------------------------"
puts ""
puts ""
print "    Quel est votre blaze de vieux? > "
humanplayer = HumanPlayer.new(gets.chomp.gsub(/[^a-z]/i, '').capitalize)
puts ""
puts ""
player1 = Ennemi.new("Josiane")
player2 = Ennemi.new("José")
puts " Vous allez vous affronter aujourd'hui contre un satané"
print " couple qui monopolise la télécommande de la salle commune"
puts gets.chomp
print " Ils sont corriaces mais pas si costauds"
puts gets.chomp
print " Allez c'est parti! "
puts ""
puts "    -------------------------------------------------"
puts "             #{humanplayer.name} VS. #{player1.name} et #{player2.name}!"
puts "    -------------------------------------------------"
puts ""
puts gets.chomp
print "    Voici l'état de l'assemblée :"
puts gets.chomp
print humanplayer.show_state
puts ""
print player1.show_state
puts ""
print player2.show_state
puts gets.chomp
puts "    Passons à la phase d'attaque :"
round = 1
choice = ""

while player1.life_points > 0 || player2.life_points > 0 && humanplayer.life_points > 0
	puts ""
	puts "     -------------------------------------------------"
	puts "                      Tour #{round}"
	puts "     -------------------------------------------------"
	puts gets.chomp
	puts "     Quelle action veux-tu effectuer ?"
	puts ""
	puts " attaquer un vieux :"
	puts " 1 - #{player1.name} a #{player1.life_points} points de vie" if player1.life_points > 0
	puts " 2 - #{player2.name} a #{player2.life_points} points de vie" if player2.life_points > 0
	puts ""
	puts " a - chercher une meilleur moyen de saccage"
	puts " s - se requinquer"
	print "    >"
	choice = ""

	if player1.life_points > 0 && player2.life_points > 0
		until choice == "a" || choice == "s" || choice == "1" || choice == "2"
			puts choice = gets.chomp.to_s
		end
	elsif player1.life_points > 0 && player2.life_points <= 0
		until choice == "a" || choice == "s" || choice == "1"
			puts choice = gets.chomp.to_s
		end
	elsif player2.life_points > 0 && player1.life_points <= 0
		until choice == "a" || choice == "s" || choice == "2"
			puts choice = gets.chomp.to_s
		end
	else
		until choice == "a" || choice == "s" || choice == "1" || choice == "2"
			puts choice = gets.chomp.to_s
		end
	end

	case choice
	when "1"
		puts humanplayer.attacks(player1)
		abort("  Du champs! Fini de jouer, bande de grabataires!\n    Enfin tu peux ronfler tranquil devant Drucker !") if (player1.life_points <= 0 && player2.life_points <= 0)
	when "2"
		puts humanplayer.attacks(player2)
		abort("  Du champs! Fini de jouer, bande de grabataires!\n    Enfin tu peux ronfler tranquil devant Drucker !") if (player1.life_points <= 0 && player2.life_points <= 0)
	when "a"
		puts humanplayer.search_weapon
	when "s"
		puts humanplayer.search_health_pack
	else
		puts "Pépé, t'as grillé une étape !"
	end

	puts "C'est l'heure de la risposte !"

	Ennemi.all.each {|ennemi|
		ennemi.attacks(humanplayer) if ennemi.life_points > 0
		abort("  Perdu On t'a mis la patée ! Une soupe et au lit !") if (humanplayer.life_points <= 0 )
	}

	print "  Fin du tour #{round}, voici l'état de chaque joueur :"
	puts gets.chomp
	puts humanplayer.show_state
	Ennemi.all.each {|ennemi| puts ennemi.show_state }
	puts gets.chomp
	round += 1
end

