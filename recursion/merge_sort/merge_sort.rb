
def merge_sort(array)

	if array.size > 2
		left = merge_sort(array[0..(array.size)/2])
		right = merge_sort(array[(array.size)/2+1..-1])
	else
		if array.size == 2
			return array[0] > array[1] ? array.reverse : array
		else
			return array
		end
	end
	merge(left,right)
end

def merge(left, right)
	array = []
	i = j = 0

	(left.size + right.size).times do
		array << 
			if right[j].nil?
				i+=1
				left[i-1]
			elsif left[i].nil?
				j+=1
				right[j-1]
			elsif left[i] < right[j]
				i+=1
				left[i-1]
			else
				j+=1
				right[j-1]
			end
	end
	array
end

# puts merge([1,5,6,8,10],[-3,-1,10,15,20]).inspect

puts merge_sort([3,2,1,5,3,5,6,5,7,9,9,2,13,9,20,0,-23]).inspect
