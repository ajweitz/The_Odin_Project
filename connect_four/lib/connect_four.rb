require 'game'

game = Game.build


while game.state == Game::NOT_FINISHED do
	puts "pick a number between 1 and 7"
	game.insert(gets.chomp)
	puts game.to_s
end
puts game.state
gets

