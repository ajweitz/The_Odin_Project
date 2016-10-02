class Timer
	#write your code here
	attr_accessor :seconds , :minutes, :hours

	def initialize
		@seconds = 0
		@minutes = 0
		@hours = 0
	end

	def time_string
		seconds > 9 ? s = @seconds.to_s : s = "0#{@seconds}"
		minutes > 9 ? m = @minutes.to_s : m = "0#{@minutes}"
		hours > 9 ? h = @hours.to_s : h = "0#{@hours}"

		"#{h}:#{m}:#{s}"
	end

	def seconds=(value)
		@minutes = value/60
		@hours = @minutes/60
		@minutes = @minutes - @hours*60
		@seconds = value - @hours*60*60 - @minutes*60
	end

end
