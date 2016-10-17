class RobotSolver


	def initialize controller
		@controller = controller
		@model = controller.model
		@symbols = controller.symbols
	end

	def self.build controller
		# new(controller.width,Model.SYMBOLS)
		new controller
	end

	def solve
		if @model.attempts == 0 
			@controller.play(@symbols.shuffle.take(@controller.width))
		else
			@model.guesses.each do |guess|
				@symbols = guess[0] if guess[1].size == @controller.width
			end
			@controller.play(@symbols.shuffle.take(@controller.width))
		end
	end


end