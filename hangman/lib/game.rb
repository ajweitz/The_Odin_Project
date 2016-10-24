
require 'json'

class Game

	DEFAULT_ALLOWED_GUESSES = 9
	JSON_FILE = File.expand_path(File.dirname(__FILE__))+"/../data/saved_game.json"

	attr_reader :used_letters, :allowed_guesses, :mistakes, :word

	def initialize word, allowed_guesses, mistakes, guessed_letters, used_letters
		@word = word
		@allowed_guesses = allowed_guesses
		@mistakes = mistakes
		@guessed_letters = guessed_letters
		@used_letters = used_letters
	end

	def self.build word, allowed_guesses = DEFAULT_ALLOWED_GUESSES
		new word, allowed_guesses, 0, Array.new(word.size), []
	end

	def self.build_from_json file = JSON_FILE
		from_json(File.read(file))
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

	def save_game(file = JSON_FILE)
		File.open(file, 'w') { |file| file.write(to_json) }
	end

	private 
	def to_json
		JSON.dump ({
			:word => @word,
			:allowed_guesses => @allowed_guesses,
			:mistakes => @mistakes,
			:guessed_letters => @guessed_letters,
			:used_letters => @used_letters
			})
	end

	def self.from_json(string)
		data = JSON.load string
		self.new(data['word'],data["allowed_guesses"],data["mistakes"],data["guessed_letters"],data["used_letters"])
	end

	def letter?(lookAhead)
  	lookAhead =~ /^[[:alpha:]]$/
	end
end