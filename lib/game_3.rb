class Game
	attr_accessor :human_player, :ennemies
	
	def initialize(name)
		@name = human_player
		human_player = HumanPlayer.new(name(/[^a-z]/i, '').capitalize)
		@ennemies << create_ennemies_array
	end
	def create_ennemi_name
		first_names = %w(Ginette Odette Madeleine Arlette Paul Bernard Guy Lucien Albert Gérard Francis Gaston)
		last_names = %w(Friponpoudan Groseille Pavoisine Tricotte Grandestin Linotte Larsoin Jarivenville Bigon Lamouise Belcuisse Courtejambe)
		return "#{first_names[rand(0..11)]} #{last_names[(rand(0..11)]}"
	end
	def create_ennemies_array(number_of_ennemies=4)
		until number_of_ennemies == 0
			ennemies_array << create_ennemi_name
			number_of_ennemies -=1
		end
	end
	def add_ennemies(number_of_ennemies=4)

	end
	def kill_player

	end

end #class game



my_game = Game.new("Wolverine")


