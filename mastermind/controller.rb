require './model'
require './view'

class Controller

	attr_reader :width, :view
	attr_accessor :model

	DEFAULT_WIDTH = 4
	NUM_OF_SYMBOLS = 6

	def initialize view, model
		@view = view
		@model = model
		@width = @model.width
	end

	def self.build(view=View.build(Model.SYMBOLS,[Model.MATCH,Model.FULL_MATCH],DEFAULT_WIDTH), model=Model.build(DEFAULT_WIDTH))
		new(view,model)
	end

	def play code
		raise ArgumentError, " wrong num of paramaters", caller unless code.size == @width
		game_over = @model.guess?(code)
		@view.redraw(@model.guesses)
		game_over
	end

	def attempts
		@model.attempts
	end

	def symbols
		Model.SYMBOLS
	end

end