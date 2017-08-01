require_relative 'cell'
class Board
	def initialize()
		@cells = (1..9).map {|i| Cell.new(i)}
		@total_moves = 0
	    @@win_arrays = [[@cells[0], @cells[1], @cells[2]],
						[@cells[3], @cells[4], @cells[5]],
						[@cells[6], @cells[7], @cells[8]],
						[@cells[0], @cells[3], @cells[6]],
						[@cells[1], @cells[4], @cells[7]],
						[@cells[2], @cells[5], @cells[8]],
						[@cells[0], @cells[4], @cells[8]],
						[@cells[2], @cells[4], @cells[6]]]
	end

	def draw_board()
	puts "╔═════╦═════╦═════╗
║  #{@cells[0]}  ║  #{@cells[1]}  ║  #{@cells[2]}  ║
╠═════╬═════╬═════╣
║  #{@cells[3]}  ║  #{@cells[4]}  ║  #{@cells[5]}  ║
╠═════╬═════╬═════╣
║  #{@cells[6]}  ║  #{@cells[7]}  ║  #{@cells[8]}  ║
╚═════╩═════╩═════╝"
	end

	def set_cell(current_player)
		print "#{current_player.name}'s turn: "
		user_input = gets.chomp
		index = user_input.to_i
		if (index > 0 && index < 10)
			if (@cells[index-1].value.is_a? Numeric)
				@cells[index-1].value = current_player.symbol
				@total_moves += 1
			else
				print "Cell taken! "
				set_cell(current_player)
			end
		elsif (user_input.downcase == 'q')
			exit
		else
			print "Invalid input! "
			set_cell(current_player)
		end
	end

	def check_winner()
		@@win_arrays.length.times do |i|
			temp = [@@win_arrays[i][0].value, @@win_arrays[i][1].value, @@win_arrays[i][2].value]
			if (temp[0] == temp[1] && temp[1] == temp[2])
				return true
			end
		end
		return false
	end

	def check_tie
		if (@total_moves >= 9)
			return true
		end
		return false
	end
end
