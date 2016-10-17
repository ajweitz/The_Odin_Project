class View

	SYMBOLS = %w[A B C D E F G H I J K L M N O P]
	MATCHES = %w[O X]
	NUM_OF_SYMBOLS = 6
	DEFAULT_WIDTH = 4

	attr_reader :symbols

	def initialize symbols, map_symbols, map_matches, width
		@symbols = symbols
		@map_symbols = map_symbols
		@map_matches = map_matches
		@width = width
	end

	def self.build(map_symbols, map_matches, width=DEFAULT_WIDTH,symbols=SYMBOLS)
		view = new(symbols.take(map_symbols.size), map_symbols, map_matches, width)
		view.print_instructions
		view
	end

	def redraw(stack)
		stack.each do |row|
			output = "[ "
			guess = row[0]
			matches = row[1]
			guess.each_index{|i| output << @symbols[@map_symbols.index(guess[i])]+" "}
			output << "] -- { "
			matches.each{|hit| output << MATCHES[@map_matches.index(hit)]+" "}
			output << "}"
			puts output
		end
		print_instructions
	end

	def print_instructions
		puts "Choose a combination of #{@width} symbols out of:"
		puts "#{@symbols}"
	end

end