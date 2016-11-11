def bubble_sort array
	array.length.times do |i|
		array[1..-(1+i)].each_with_index do |val, index|
			prev_val = array[index]
			array[index+1], array[index] = prev_val, val if val < prev_val
		end	
	end
	array
end

def bubble_sort_by array

		array.length.times do |i|
		array[1..-(1+i)].each_with_index do |val, index|
			prev_val = array[index]
			array[index+1], array[index] = prev_val, val if yield(prev_val,val) >0
		end	
	end
	array
end


puts bubble_sort([4,3,78,2,1,2,4,5,80,-2,4,5,18,17,250,34,-2,4,0,2]).inspect
puts bubble_sort(["a","b","d","z","a","h"]).inspect
sorted = bubble_sort_by(["loooooong word","wassauup","hi","hello","hey","a"]) do |left,right|
	left.length - right.length
 end

puts sorted.inspect