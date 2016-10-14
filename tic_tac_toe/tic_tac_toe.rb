
require './game_controller'
require './player'
controller = GameController.build

robot = false
loop do
	puts "Choose number of player (1 or 2)"
	num_of_players = gets.chomp
	if num_of_players != "1" && num_of_players != "2"
		puts "Error parsing the input"
	else
		robot = num_of_players.to_i == 1 ? true : false
		break
	end
end
puts "Choose name for player 1"
p_1_name = gets.chomp
puts "Choose name for player 2"
p_2_name = gets.chomp

player_a = Player.build(p_1_name)
player_b = Player.build(p_2_name, robot)
# current_player = nil

loop do
	current_player = (controller.turn == :x) ? player_b : player_a
	puts "#{current_player} turn:"
	current_player.played_move(controller.play_turn(current_player.play))

	puts Player.played.inspect
end
