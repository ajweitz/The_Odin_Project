class Player
	attr_accessor :name
	def initialize name, robot
		@name = name
		@robot = robot
		@@played = []
	end

	def self.build(name, robot=false)
		new(name,robot)
	end

	def play
		move = gets.chomp
	end

	def played_move move
		@@played << move if move != [nil,nil]
	end

	def self.played
		@@played
	end

	def to_s
		@name
	end

	def ==(o)
		o.class == self.class && o.name == self.name
	end

end