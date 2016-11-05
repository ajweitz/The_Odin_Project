
require_relative './converter'

class Board

	FIRST_ROW = 1
	LAST_ROW = 8
	FIRST_COLUMN = 'a'
	LAST_COLUMN = 'h'

	def initialize
		columns = Converter.to_int(LAST_COLUMN)
		@board = Array.new((columns+1)*LAST_ROW,nil)
	end

	def [](letter,num)
		@board[(num-1)*LAST_ROW+Converter.to_int(letter)]
	end

	def []=(letter,num,value)
		@board[(num-1)*LAST_ROW+Converter.to_int(letter)] = value
	end


end