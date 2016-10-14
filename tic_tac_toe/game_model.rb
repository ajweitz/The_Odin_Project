require './matrix.rb'

class GameModel

	DEFAULT_SIZE=3

	def initialize(height, width, board_matrix)
		@height = height
		@width = width
		@board_matrix = board_matrix
	end

	def self.build(size=DEFAULT_SIZE)
		size = DEFAULT_SIZE if size<3		
		new(size,size,Matrix.build(size,size))
	end

	def set_cell(w,h, value)
		raise ArgumentError, " Value should be :x or :o", caller unless (value == :x) || (value == :o)
		raise IndexError, "Out of bounds", caller unless w.between?(0,@width-1) && h.between?(0,@height-1)
		@board_matrix[w][h].nil? ? @board_matrix[w][h]=value : raise(IndexError, "Cell is not empty", caller)
	end
end