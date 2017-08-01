require_relative 'board'
require_relative 'player'
class Game
	def initialize
		@player1 = Player.new
		@player2 = Player.new
	end

	def new_game
		@board = Board.new
		@current_player = @player1
		play_turn(@current_player)		
	end

	def play_turn(current_player)
		display_instructions
		@board.draw_board
		@board.set_cell(@current_player)
		if (@board.check_winner())
			puts "\n\n"
			@board.draw_board
			puts "#{@current_player.name} has won!"
			game_over
		else
			if (@board.check_tie)
				puts "Tie!"
				game_over
			else
				switch_player
			end
		end
	end

	def switch_player
		case @current_player
		when @player1 then @current_player = @player2
		when @player2 then @current_player = @player1
		end
		play_turn(@current_player)
	end

	def display_instructions
		puts "\n\nInput Options:"
		puts "Q - Quit Game"
		puts "1..9 - Place on that cell"
	end

	def game_over
		puts "\n\n1 - New Game"
		puts "2 - Quit Game"
		user_input = gets.chomp.to_i
		case user_input
		when 1 then new_game
		when 2 then exit
		else puts "Please enter a valid option"
			game_over
		end		
	end
end

Game.new().new_game
