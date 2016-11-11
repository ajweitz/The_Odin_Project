def caesar_cipher(str, n)
	str.split("").collect do |char|
		if ("a".."z") === char
			shift(char,n,"a")
		elsif ("A".."Z") === char
			shift(char,n,"A")
		else
			char
		end
	end.join
end

def shift(letter, n, from)
	alphabet_length = 26
	((letter.ord+n-from.ord)%alphabet_length+from.ord).chr
end

