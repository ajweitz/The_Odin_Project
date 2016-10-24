
class Game

	DEFAULT_ALLOWED_GUESSES = 9

	attr_reader :used_letters, :allowed_guesses, :mistakes, :word

	def initialize word, allowed_guesses
		@word = word
		@allowed_guesses = allowed_guesses
		@mistakes = 0
		@guessed_letters = Array.new(word.size)
		@used_letters = []
	end

	def self.build word, allowed_guesses = DEFAULT_ALLOWED_GUESSES
		new word, allowed_guesses
	end

	def guess letter
		raise ArgumentError, "Not a letter", caller unless letter?(letter) && !@used_letters.include?(letter.downcase)
		@used_letters << letter.downcase
		if @word.include?(letter)
			@word.downcase.split("").each_with_index{|v,i| @guessed_letters[i] = v if letter.downcase == v}
		else
			@mistakes += 1
		end
		@mistakes == @allowed_guesses || !@guessed_letters.include?(nil) ? false : true
	end

	def draw
		@guessed_letters.each{ |letter| letter.nil? ? print("_ ") : print(letter," ") }
		puts
	end

	private 

	def letter?(lookAhead)
  	lookAhead =~ /^[[:alpha:]]$/
	end
end