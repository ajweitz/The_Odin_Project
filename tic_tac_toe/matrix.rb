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

	def each_row(index)
		self.size.times do |j|
			yield self[j][index]
		end
		self
	end

	def left_cross
		return nil if self.length != self[0].length
		self.length.times do |i|
			yield self[i][i]
		end
		self
	end

	def right_cross
		return nil if self.length != self[0].length
		self.length.times do |i|
			yield self[i][self.length-(1+i)]
		end
		self
	end
end