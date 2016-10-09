def caesar_cipher str, n
	str.split("").collect do |char|
		if ("a".."z") === char
			shift char,n,"a","z"
		elsif ("A".."Z") === char
			shift char,n,"A","Z"
		else
			char
		end
	end.join
end

def shift letter, n, from,to
	if (from..to) === letter
		letter = (letter.ord+n).chr
		letter=shift from,(letter.ord-to.ord-1),from,to if letter > to
		letter=shift to,(from.ord-letter.ord-1),from,to if letter < from
	end
	letter
end

puts (caesar_cipher "What a string!", -1)