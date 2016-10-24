require_relative './word_generator'
require_relative './game'




loop do
game = Game.build(WordGenerator.build.word)
puts "Guess the word by entering the letters, you can have up to #{game.allowed_guesses} guesses"
	begin
		
	while game.guess(gets.chomp)
		game.draw
		game.used_letters.sort.each_with_index do |l,i| 
			print l
			i != (game.used_letters.length - 1) ? print(", ") : puts("")
		end
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
end