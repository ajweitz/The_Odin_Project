class WordGenerator

	DEFAULT_FILE_PATH = File.expand_path(File.dirname(__FILE__))+"/../5desk.txt"

	attr_accessor :word

	def initialize word
		@word = word
	end

	def self.build file = DEFAULT_FILE_PATH , line = random_line(file)
		 word = ""
		 lines_c = lines_count(file)
		 while word.size < 5 || word.size > 12 || word.capitalize == word
		 	line = 0 if line == lines_c
		 	word = IO.readlines(file)[line].strip
		 	line += 1
		 end
		 new word
	end

	private 

	def self.random_line(file)
		rand(lines_count(file))
	end

	def self.lines_count(file)
		File.foreach(file).inject(0) {|c, l| c+1}
	end
end