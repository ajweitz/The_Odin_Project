require './board_view'
require './game_model'


class GameController

	DEFAULT_SIZE = 3
	ALLOWED_VALUES = ["X","x","O","o"]
	FIRST_TURN = :x
	SECOND_TURN = :o

	attr_reader :turn

	def initialize(view, model,turn)
		@view = view
		@model = model
		@turn = turn
	end

	def self.build(size=DEFAULT_SIZE)
		view = BoardView.build(size)
		view.redraw
		new(view, GameModel.build(size), FIRST_TURN)
	end

	def play_turn str

		w = str[/[0-9]/].to_i-1
		h = (str[/[[:alpha:]]/].downcase.ord - "a".ord).to_i
		set_cell(w,h,@turn)

	rescue StandardError	
		print "Failed to parse the command, try again\n"
		w = h = nil
	else
		toggle_turn
	ensure
		@view.redraw
		return [w,h]
	end

	
	private

	def set_cell(w,h, value)
		@model.set_cell(w, h, value)
		@view.set_cell(w, h, value)
	end

	def toggle_turn
		@turn = @turn == FIRST_TURN ? SECOND_TURN : FIRST_TURN
	end
end