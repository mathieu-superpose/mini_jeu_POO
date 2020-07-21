require 'pry'
require_relative 'player_2'

class Game
	attr_accessor :human_player, :ennemies
	
	def initialize(name)
		@human_player = human_player
		human_player = HumanPlayer.new(name(/[^a-z]/i, '').capitalize)
		@ennemies << create_ennemies_array
	end#intialyse
	def create_ennemi_name
		first_names = %w(Ginette Odette Madeleine Arlette Paul Bernard Guy Lucien Albert Gérard Francis Gaston)
		last_names = %w(Friponpoudan Groseille Pavoisine Tricotte Grandestin Linotte Larsoin Jarivenville Bigon Lamouise Belcuisse Courtejambe)
		randomp1 = rand(0..11)
		randomp2 = rand(0..11)
		return "#{first_names[randomp1]} #{last_names[randomp2]}"
	end#create_ennemi_name
	def create_ennemies_name_array(number_of_ennemies=4)
		until number_of_ennemies == 0
			ennemies_names_array << create_ennemi_name
			number_of_ennemies -=1
		end
	end#create_ennemies_name_array
	def add_ennemies(number_of_ennemies=4)

	end#add_ennemies
	def kill_player(player)
		return ennemies -= [player]
	end
	def is_still_ongoing?
		(human_player.life_points > 0 && ennemies != []) ? (true) : (false)
	end
	def show_players

	end

	binding.pry
end #class game


my_game = Game.new("Wolverine")