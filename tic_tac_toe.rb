class TicTacToe
	def initialize(game_mode)
		@game_mode = game_mode
		start_game
	end
	def start_game
		display_instructions
		draw_board

		
	end

	def display_instructions
		puts "Enter 1-9 to place on that tile (Q to quit game)"
	end

	def draw_board
		tile = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		puts (" #{tile[0]} | #{tile[1]} | #{tile[2]}\n---+---+---\n #{tile[3]} | #{tile[4]} | #{tile[5]}\n---+---+---\n #{tile[6]} | #{tile[7]} | #{tile[8]}\n")
	end
end

def display_menu
	puts "1 - Play with Friend"
	puts "2 - Play with AI"
end

user_input = nil
while (user_input != "Q" || user_input != "q")
	display_menu
	user_input = gets.chomp.to_i

	case user_input
	when 1 then new_game = TicTacToe.new("friend")
	when 2 then new_game = TicTacToe.new("ai")	
	else
		puts "Please choose either '1' or '2'"
	end


	# new_game.draw_board()
	# new_game.display_menu
	# user_input = gets.chomp
	# break
end