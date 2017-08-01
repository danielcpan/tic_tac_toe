class Player
	@@player_count = 1
	@@player_symbols = ['X', 'O']
	def initialize()
		puts "Player #{@@player_count}:"
		puts "Please enter name"
		@name = gets.chomp
		puts "You are symbol '#{@@player_symbols[@@player_count-1]}'"
		@symbol = @@player_symbols[@@player_count-1]
		if (@@player_count == 2)
			@@player_count = 0
		end
		@@player_count += 1
	end
	attr_accessor:name
	attr_accessor:symbol
end