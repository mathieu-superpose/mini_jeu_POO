
# 2 joueurs ;
# Que chaque joueur ait un niveau de vie donné ;
# Que ce niveau de vie baisse à chaque attaque subie ;
# Si la vie atteint zéro, le personnage est mort.

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 20
	end#initialize
	def show_state
		return (life_points > 0)? ("#{name} a #{life_points} points de vie") : ("#{name} est retourné dans sa chaise à bascule")
	end#show_state
	def gets_damage(damage_points)
		@life_points -= damage_points
		" #{name} a perdu pied et abandonne le terrain !" if life_points <= 0 
	end#gets_damage(damage_points)
	def compute_damage
    	return rand(1..6)
  	end#compute_damage
	def attacks(player)
		damage = compute_damage
		print "#{@name} attaque #{player.name}"
		print ", qui reçoit #{damage} points de dommages"
		puts gets.chomp
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
		return "#{name} a #{life_points} points de vie et #{show_weapon}"#  de niveau #{weapon_level}"
	end#show_state
	def show_weapon
		case weapon_level
		when 1
			return "une canne"
		when (2..5)
			return "une paire de béquilles en acier"
		when 6
			return "une canne-épée historique"
		else
			return "ses dix doigts"
		end
	end
	def compute_damage
		rand(1..6) * @weapon_level
  	end#compute_damage
  	def search_weapon
  		level = rand(1..6)
  	
	  	if level > @weapon_level && level > 5
	  		puts " Tu as retrouvé la canne-épée de tes ailleuls!"
	  		puts " C'est l'arme de dissuasion ultime !"
	  		puts " Mieux vaut y aller gentiment, tu ne veux pas tordre la lame ."
	  		@weapon_level = level
	  	elsif level > @weapon_level && level < 6
	  		puts " Tu as trouvé une béquille en acier!"#arme de niveau #{level}!"
	  		print gets.chomp
	  		puts " Chic ! ses coups dans les guiboles vont rapidement"
	  		puts " faire partir ces mécréants !"
	  		@weapon_level = level
	  		print gets.chomp
	  	else 
	  		puts " M@*#$ quenouilles!... pas mieux que ma vieille trique!..."
	  	end
  	end#search_weapon
  	def search_health_pack
  		level = rand(1..6)
  		case level
  		when 1
  			puts "Bredouille... "
  		when (2..5)
  			puts "Requiqué ! Ce godet de pinard te donne +50 points de vie !"
  			(life_points <= 50) ? (life_points += 50) : (life_points = 100)
  		when (6)
  			puts "Milles busettes ! Tu as gobé tous tes médocs: +80 points de vie !"
  			(life_points <= 20) ? (life_points += 80) : (life_points = 100)
  		end
  		show_state
  	end#search_health_pack
end#class HumanPlayer

class Ennemi < Player
	@@ennemies = []

	def initialize(name)
		@name = name
		@life_points = 10
		@@ennemies << self
		#puts "New ennemi! #{name} #{rand(60..99)}"
	end#initialize
	def self.all
    @@ennemies
  	end#self.all
end#class Ennemi



