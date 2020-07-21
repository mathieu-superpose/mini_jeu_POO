
# 2 joueurs ;
# Que chaque joueur ait un niveau de vie donné ;
# Que ce niveau de vie baisse à chaque attaque subie ;
# Si la vie atteint zéro, le personnage est mort.

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
		puts self
	end#initialize
	def show_state
		return "#{name} a #{life_points} points de vie"
	end#show_state
	def gets_damage(damage_points)
		@life_points -= damage_points
		"le joueur #{name} a été tué !" if life_points <= 0 
	end#gets_damage(damage_points)
	def attacks(player)
		damage = compute_damage

		puts player.name
		
		# case player
		# when player1
		# 	puts "le joueur player2 attaque le joueur player1"
		# 	puts "il lui inflige #{damage} points de dommages"
		# 	player2.gets_damage(damage_points)
		# when player2
		# 	puts "le joueur player1 attaque le joueur player2"
		# 	puts "il lui inflige #{damage} points de dommages"
		# 	player1.gets_damage(damage_points)
		# end
    end#attacks(player)
    def compute_damage
    	return rand(1..6)
  	end#compute_damage

end#class player