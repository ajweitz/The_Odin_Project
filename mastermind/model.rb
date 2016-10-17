class Model

	DEFAULT_WIDTH=4
	SYMBOLS=[:A,:B,:C,:D,:E,:F]
	MATCH = :O
	FULL_MATCH = :X

	attr_reader :code, :guesses, :width

	def initialize width, code
		@width=width
		@code = code
		# puts @code.inspect
		@guesses = []
	end

	def self.build(width=DEFAULT_WIDTH, code=SYMBOLS.shuffle)
		new(width,code.take(width))
	end

	def guess?(user_code)
		matches = calculateDiffs(user_code).sort.reverse
		@guesses << [user_code,matches]
		matches.count(FULL_MATCH) == DEFAULT_WIDTH ? true : false
	end

	def self.SYMBOLS
		SYMBOLS
	end

	def self.MATCH
		MATCH
	end

	def self.FULL_MATCH
		FULL_MATCH
	end

	def attempts
		@guesses.size
	end

	private

	def calculateDiffs user_code
		matches = []
		user_code.each do |slot|
			if @code.include? slot
				 @code[user_code.index slot] == slot ? matches << FULL_MATCH : matches << MATCH				
			end
		end
		matches	
	end

end