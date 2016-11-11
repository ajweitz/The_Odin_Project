module Enumerable
	def my_each
		self.length.times do |i|
			yield self[i]
		end
		self
	end

	def my_each_with_index array
		array.length.times do |i|
			yield array[i], i
		end
		array
	end

	def my_select
		new_arr =[]
		self.my_each do |val|
			new_arr<<val if yield val
		end
		new_arr
	end

	def my_all?
		self.my_each do |val|
			return false unless yield val
		end
		true
	end

	def my_any?
		self.my_each do |val|
			return true if yield val
		end
		false
	end

	def my_none?
		self.my_each do |val|
			return false if yield val
		end
		true
	end

	def my_count

		return my_count{|v| true} unless block_given?
		c=0
		self.my_each do |val|
			c+=1 if yield val
		end
		c
	end

	def my_map
		array=[]
		self.my_each do |v|
			array << (yield v)
		end
		array
	end

	def my_map_ver2 &proc
		array=[]
		self.my_each do |v|
			array << (proc.call v)
		end
		array
	end

	def my_map_ver3
		
	end

	def my_inject
		memo = self[0]
		unless memo.nil?
			self[1..-1].my_each do |val|
				memo = yield memo, val
			end
		end
		memo
	end
end

def multiply_els arr
	arr.my_inject{|memo,val| memo*val}
end

