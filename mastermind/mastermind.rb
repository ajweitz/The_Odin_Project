require './model'
require './controller'

restart_game = ["res","restart","new","retry","reset"]
exit_program = ["exit","quit","finish","escape","q!",":q!","abort"]

puts "Hello and welcome to mastermind"

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

			game_over = controller.play(input.gsub(/\W+/, '').upcase.split(//).map{|l| l.to_sym})
		rescue Exception => e
			puts "something went wrong parsing your input, try again"
			# input = gets.chomp
			next
		end
		if game_over
			3.times{puts ("="*20)}
			puts "You solved the code in #{controller.attempts}"
			puts "Do you want to player another game (Y/N)?"
			begin
				result = gets.chomp
				result[/[[:alpha:]]/].downcase == "y" ? controller = Controller.build : Kernel.exit()
			rescue Exception => e
				Kernel.exit()
			end
		end
	end
	
end

# controller.play([:A,:B,:C,:D])
# puts "Second turn:"
# controller.play([:A,:C,:E,:D])

