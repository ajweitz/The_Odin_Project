def substrings string, dictionary
	mapping={}
	arr_subs=[]
	string.split(" ").each do |s|
	arr_subs += possible_substrings s
	end
	arr_subs.each do |str|
		if dictionary.include? str
			if mapping.key? str
				mapping[str]=mapping[str]+dictionary.count(str) 
			else
				mapping[str]=dictionary.count(str) 
			end
		end
	end
	mapping
end

def possible_substrings str
	# puts str
	subs = [str]
	unless str.length == 1
		subs += possible_substrings(str[0..-2])
		subs += possible_substrings(str[1..-1])
	end
	subs.uniq
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print substrings("below", dictionary),"\n"
print substrings("Howdy partner, sit down! How's it going?", dictionary),"\n"