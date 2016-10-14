class Matrix < Array
	DEFAULT_SIZE =3


	def self.build(width=DEFAULT_SIZE,height=DEFAULT_SIZE)
		self.new(width).map!{ Array.new(height) }
	end

	def fill(value)
		self.collect do |column|
			column.fill {|cell| value}
		end
	end
end