
# 2 joueurs ;
# Que chaque joueur ait un niveau de vie donné ;
# Que ce niveau de vie baisse à chaque attaque subie ;
# Si la vie atteint zéro, le personnage est mort.

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 50
		#puts self
	end#initialize
	def show_state
		return "#{name} a #{life_points} points de vie"
	end#show_state
	def gets_damage(damage_points)
		@life_points -= damage_points
		"le joueur #{name} a été tué !" if life_points <= 0 
	end#gets_damage(damage_points)
	def compute_damage
    	return rand(1..6)
  	end#compute_damage
	def attacks(player)
		damage = compute_damage
		puts "#{@name} attaque #{player.name}"
		puts "il lui inflige #{damage} points de dommages"
		puts player.gets_damage(damage)
    end#attacks(player)
end#class Player

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end#initialize
	def show_state
		return "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
	end#show_state
	def compute_damage
    rand(1..6) * @weapon_level
  	end#compute_damage
  	def search_weapon
  	level = rand(1..6)
  	puts "Tu as trouvé une arme de niveau #{level}!"
	  	if level > @weapon_level
	  		puts"Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
	  		@weapon_level = level
	  	else 
	  		puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
	  	end
  	end#search_weapon
end#class HumanPlayer


