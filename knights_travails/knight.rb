require_relative './converter'



class Knight

	def initialize(letter,num)
		@position = [letter,num]
	end

	def possible_moves
		column = Converter.to_int(@position[0])
		row = @position[1] - 1
		legal_moves = []
		[	[column-2,row-1],
			[column-2,row+1],
			[column+2,row+1],
			[column+2,row-1],
			[column+1,row+2],
			[column+1,row-2],
			[column-1,row+2],
			[column-1,row-2]
		].each do |value|
			legal_moves << [Converter.to_letter(value[0]),value[1]+1] if value[0].between?(0,7) && value[1].between?(0,7)
		end
		legal_moves
	end

	def knight_moves(letter,num)
		target = [letter,num]
		moves_history = {}
		visited = []
		queue = [@position]

		loop do
			move = queue.shift
			break if move == target
			visited << move unless visited.include?(move)
			legal_moves = (self.class.new(move[0],move[1])).possible_moves
			legal_moves -= visited
			legal_moves.each do |son| 
				moves_history[son] = move
				queue.push(son)
			end
		end
		result = []
		move = target
		loop do
			result << move
			break if move == @position
			move = moves_history[move]
		end
		result.reverse
	end

end