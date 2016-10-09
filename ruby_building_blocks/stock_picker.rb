def stock_picker arr
	pairs = {}
	buy = sell = 0
	while buy < arr.length
		while  buy <arr.length-1 and arr[buy]>arr[buy+1]
			buy+=1
		end
		if buy < arr.length
			sell = arr.index(arr[buy..-1].max)
			buy = arr.index(arr[buy..sell].min)
			pairs[arr[sell]-arr[buy]] = [buy,sell] 
			buy = sell+1
		end
	end
	pairs.max[1..2][0]
end

print stock_picker([17,3,6,9,15,8,6,1,10]),"\n"
print stock_picker([17,6,13,18,22,4,3,1,11,2,3,4,5,3,2,29]),"\n"