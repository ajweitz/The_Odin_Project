require './model'
require './controller'
require './robot_solver'

restart_game = ["res","restart","new","retry","reset"]
exit_program = ["exit","quit","finish","escape","q!",":q!","abort"]

def getCode(str)
	str.gsub(/\W+/, '').upcase.split(//).map{|l| l.to_sym}
end

def play_again? controller
	3.times{puts ("="*20)}
	puts "The code was solved in #{controller.attempts}"
	puts "Do you want to player another game (y/N)?"
	gets.chomp[/[[:alpha:]]/].downcase == "y" ? true : false
end



puts "Hello and welcome to mastermind"
loop do
	puts "Play or Riddle? P/r"
	if gets.chomp == "r"

		puts "Write the secret code"
		controller = Controller.build
		secretCode = getCode(gets)
		roboModel = Model.build(controller.width,secretCode)
		controller.model = roboModel
		robot = RobotSolver.build(controller)

		loop do
			$stdout.flush
			sleep(1)
			game_over = robot.solve
			if game_over
					if play_again?(controller)
						break;
					else
						Kernel.exit()
					end
			end
		end

	else

		controller = Controller.build

		loop do 
		# puts controller.

			input = gets.chomp
			if restart_game.map{|w| w.downcase}.include?(input)
				controller = Controller.build
				Player.reset
			elsif exit_program.map{|w| w.downcase}.include?(input)
				Kernel.exit()
			else
				# puts input.gsub(/\W+/, '').upcase.split(//)
				begin

					game_over = controller.play(getCode(input))
				rescue Exception => e
					puts "something went wrong parsing your input, try again"
					# input = gets.chomp
					next
				end
				if game_over
					if play_again?(controller)
						break;
					else
						Kernel.exit()
					end
				end
			end
		end
	end
end
# controller.play([:A,:B,:C,:D])
# puts "Second turn:"
# controller.play([:A,:C,:E,:D])



