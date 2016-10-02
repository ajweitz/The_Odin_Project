#write your code here




def translate var
	words = var.split(" ")
	words.collect { |word| translate_word(word)+" " }.join.strip

end
def translate_word var

	vowels = "aeuio"
	i = 0
	vowel_found = false
	while i<var.length and !vowel_found do
		vowel_found = true if vowels.include?(var[i]) and (i == 0 or !"qu".include?(var[i-1..i]))
		i += 1
	end
	rotate(var,i-1)+"ay"
end

def rotate str, n
	return str[n..(str.length-1)]+str[0..n-1] if n>0
	str
end
