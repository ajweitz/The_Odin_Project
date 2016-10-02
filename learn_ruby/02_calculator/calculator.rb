#write your code here

def add a, b
	a+b
end

def subtract a,b
	a-b
end

def sum arr
	total=0
	arr.each {|n| total+=n }
	total
end

def multiply a, b, *c
	sum = a*b
	c.each {|n| sum*=n}
	sum
end

def power a,b
	a**b
end

def factorial n
	factored = 1
	n.times { |i| factored*=(i+1) }
	factored
end


