require './matrix.rb'

class GameModel

	DEFAULT_SIZE=3

	def initialize(height, width, board_matrix)
		@height = height
		@width = width
		@board_matrix = board_matrix
		@moves = 0
	end

	def self.build(size=DEFAULT_SIZE)
		size = DEFAULT_SIZE if size<3		
		new(size,size,Matrix.build(size,size))
	end

	def set_cell(w,h, value)
		raise ArgumentError, " Value should be :x or :o", caller unless (value == :x) || (value == :o)
		raise IndexError, "Out of bounds", caller unless w.between?(0,@width-1) && h.between?(0,@height-1)
		@board_matrix[w][h].nil? ? @board_matrix[w][h]=value : raise(IndexError, "Cell is not empty", caller)
		@board_matrix[w][h]=value
		@moves += 1
	end


	def check_winner
		
		return :x if winner?(:x)
		return :o if winner?(:o)		
		return :draw if @moves >= @width*@height
		:game_in_progress
	end
	private

	def winner?(player)
		@board_matrix.each do |column|
			total=0
			column.each{|cell| total+=1 if cell == player}
			return true if total == @height
		end
		@width.times do |i|
			total=0
			@board_matrix.each_row(i){|val| total+=1 if val == player}
			return true if total == @width 
		end
		total = 0 
		@board_matrix.left_cross{|val| total+=1 if val == player}
		return true if total == @width
		total = 0 
		@board_matrix.right_cross{|val| total+=1 if val == player}
		return true if total == @width

		false
	end
end