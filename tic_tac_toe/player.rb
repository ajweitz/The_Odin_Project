class Player
	attr_accessor :name
		@@played = []
	def initialize name, robot
		@name = name
		@robot = robot
	end

	def self.build(name, robot=false)
		new(name,robot)
	end

	def play
		if @robot
			loop do 
				h = rand(0..2)
				w = rand(1..3)
				h_char = (h+'a'.ord).chr
				return "#{w}#{h_char}"unless @@played.include?([w,h_char])
			end

		else
			move = gets.chomp
		end
	end

	def played_move move
		@@played << move if move != [nil,nil]
	end

	def self.played
		@@played
	end

	def self.reset
		@@played = []
	end

	def to_s
		@name
	end

	def ==(o)
		o.class == self.class && o.name == self.name
	end

end