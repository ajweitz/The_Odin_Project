class Book
# write your code here
	attr_reader :title

	def title=(value)
		word_exceptions = ["and","in","the","on","of","a","an"]
		@title = value.capitalize.split(" ").collect { |word| word_exceptions.include?(word) ? word+" " : word.capitalize+" "}.join.strip
	end

end
