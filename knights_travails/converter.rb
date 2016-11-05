module Converter
	def self.to_int(letter)
		('a'..'h'.downcase).to_a.index(letter.downcase)
	end

	def self.to_letter(num)
		('a'.ord+num).chr
	end
end