#write your code here
def echo val
	val
end

def shout val
	val.upcase
end

def repeat val, n=2
	result = ""
	n.times { result+="#{val} "}
	result.strip
end

def start_of_word str, n
	str[0..n-1]
end

def first_word str
	str.split(" ")[0]
end

def titleize str
	str.capitalize.split(" ").collect { |word| (word == "and" or word == "over" or word == "the") ? word+" " : word.capitalize+" " }.join.strip
end