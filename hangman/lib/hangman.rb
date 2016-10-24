require_relative './word_generator'
require_relative './game'


def print_state(game)
	game.draw
	game.used_letters.sort.each_with_index do |l,i| 
		print l
		i != (game.used_letters.length - 1) ? print(", ") : puts("")
	end
end

puts "Do you want to load last saved game?"
game = gets.chomp[/[[:alpha:]]/].downcase == "y" ? Game.build_from_json : Game.build(WordGenerator.build.word)

loop do
	if game.used_letters.empty?
		puts "Guess the word by entering the letters, you can have up to #{game.allowed_guesses} guesses"
	else
		print_state(game)
	end
	begin
		
	loop do 
		input = gets.chomp
		if input == "save"
			game.save_game
			redo
		end

		break unless game.guess(input)
		print_state(game)
		puts "GUESSES LEFT: #{game.allowed_guesses - game.mistakes}"
	end
	game.draw
	puts "GAME OVER!"
	game.mistakes == game.allowed_guesses ? puts("The word was: #{game.word}") : puts("You WON!!!")
	puts "Do you want to player another game (Y/N)?"
	begin
		result = gets.chomp
		Kernel.exit() unless result[/[[:alpha:]]/].downcase == "y"
	rescue Exception => e
		Kernel.exit()
	end
	rescue ArgumentError => e
		puts "Please enter a letter"
		retry
	end
game = Game.build(WordGenerator.build.word)
end