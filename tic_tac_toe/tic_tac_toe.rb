
require './game_controller'
require './player'
restart_game = ["res","restart","new","retry","reset"]
exit_program = ["exit","quit","finish","escape","q!",":q!","abort"]


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

controller = GameController.build

loop do
	current_player = (controller.turn == :x) ? player_b : player_a
	puts "#{current_player} turn:"

	move = current_player.play.downcase
	if restart_game.map{|w| w.downcase}.include?(move)
		controller = GameController.build
		Player.reset
	elsif exit_program.map{|w| w.downcase}.include?(move)
		Kernel.exit()
	else
		played_move = controller.play_turn(move)

		if played_move == :end_game
			puts "Do you want to player another game (Y/N)?"
			begin
				result = gets.chomp
				result[/[[:alpha:]]/].downcase == "y" ? controller = GameController.build : Kernel.exit()
			rescue Exception => e
				Kernel.exit()
			end
			Player.reset
		else
			current_player.played_move(played_move) 
		end
	end
end