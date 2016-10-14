require './matrix.rb'

class BoardView
	X="|x"
	O="|o"
	EMPTY_CELL="|_"
	DEFAULT_SIZE=3
	MAX_SIZE = 26

	def initialize(height, width, board_matrix)
		@height = height
		@width = width
		@board_matrix = board_matrix
	end

	def self.build(size=DEFAULT_SIZE)
		size = MAX_SIZE if size>MAX_SIZE
		size = DEFAULT_SIZE if size<3

		board_matrix = Matrix.build(size,size)
		board_matrix.fill(EMPTY_CELL)

		new(size,size,board_matrix)
	end

	def set_cell(w,h, value)
		raise ArgumentError, " Value should be :x or :o", caller unless (value == :x) || (value == :o)
		raise IndexError, "Out of bounds", caller unless w.between?(0,@width-1) && h.between?(0,@height-1)
		value = value == :x ? X : O
		@board_matrix[w][h] = value
	end

	def redraw
		puts draw_board
	end
	
	def to_s
		draw_board
	end

	private

	def draw_board
		board = ""
		letter_map = 'a'.ord
		left_margin = 4

		board = " "*left_margin
		@width.times { |i| i<8 ? board<<"#{i+1} " : board<<"#{i+1}" }
		board << "\n"+" "*left_margin
		@width.times { |i| board<<"_ " }
		board << "\n"
		@height.times do |i|
			board<<(i+letter_map).chr+" "*(left_margin-2)
			@width.times { |j| board<<@board_matrix[j][i] }
			board<<"|\n"
		end
		board
	end
end

# str = <<-START
#     1 2 3
#     _ _ _
# a  |x|o|o|
# b  |_|x|_|
# c  |_|_|x|
# START
# puts str
