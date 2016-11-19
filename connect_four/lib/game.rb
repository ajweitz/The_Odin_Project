require_relative 'board'

class Game

	RED = "⚫"
	BLUE = "⚪"
	NOT_FINISHED = :NOT_FINISHED
	DRAW = :DRAW
	RED_WON = :RED_WON
	BLUE_WON = :BLUE_WON

	attr_reader :board

	def initialize(board)
		@board = board
		@turn = RED
	end
	
	def self.build
		new (Board.build)
	end
	
	def insert(row)
		return false unless @board.insert(row,@turn)
		toggle_turn
		true
	end

	def state

		winner_by_row = state_rows
		return winner_by_row if winner_by_row

		winner_by_column = state_columns
		return winner_by_column if winner_by_column

		winner_by_diagonal = state_diagonal
		return winner_by_diagonal if winner_by_diagonal

		@board.table.each{ |row| return NOT_FINISHED if row.include?(nil)}
		DRAW
	end

	def to_s
		str = ""
		@board.table[0].size.times do |i|
			@board.table.size.times do |j|
				str += @board.table[j][@board.table[0].size - i -1].nil? ? " " : @board.table[j][@board.table[0].size - i -1]
			end
			str +="\n"
		end
		str		
	end

	private

	def state_rows
		@board.table.each do |row|
			str = row.join
			return RED_WON if str.include?(RED*4)
			return BLUE_WON if str.include?(BLUE*4)
		end
		false
	end

	def state_columns
		@board.table[0].size.times do |i|
			str = ""
			@board.table.size.times do |j|
				str += @board.table[j][i].nil? ? "nil" : @board.table[j][i]
			end
			return RED_WON if str.include?(RED*4)
			return BLUE_WON if str.include?(BLUE*4)
		end
		false
	end

	def state_diagonal
		table = @board.table
		columns = table.size
		rows = table[0].size
		(columns-3).times do |i|
			(rows-3).times do |j|
				str = "" + table[i][j].to_s + table[i+1][j+1].to_s + table[i+2][j+2].to_s + table[i+3][j+3].to_s
				return RED_WON if str.include?(RED*4)
				return BLUE_WON if str.include?(BLUE*4)
			end
			(rows-3).times do |j|
				j += 3
				str = "" + table[i][j].to_s + table[i+1][j-1].to_s + table[i+2][j-2].to_s + table[i+3][j-3].to_s
				return RED_WON if str.include?(RED*4)
				return BLUE_WON if str.include?(BLUE*4)
			end
		end
		false
	end

	def toggle_turn
		@turn = @turn == RED ? BLUE : RED
	end

end