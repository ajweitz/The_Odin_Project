
class Board

	DEFAULT_WIDTH = 7
	DEFAULT_HEIGHT = 6

	attr_reader :table

	def self.build(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
		new Array.new(width){Array.new(height)}
	end

	def initialize table
		@table = table
	end

	def insert(row, value)
		return false unless @table[row].any?{ |value| value == nil}
		@table[row][@table[row].find_index(nil)] = value
		true
	end

	def ==(other_object)
		@table == other_object.table
	end

	def eql?(other_object)
		self == other_object
	end
end