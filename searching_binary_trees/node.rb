class Node

	attr_accessor :value, :parent, :left, :right

	def initialize value, parent = nil, left = nil, right = nil
		@value = value
		@parent = parent
		@left = left
		@right = right
	end

	def add(node)
		if node.value > @value
			if @right.nil? 
				@right = node 
				node.parent = self 
			else
			 @right.add(node)
			end
		else
			if @left.nil? 
				@left = node
				node.parent = self 
			else
			 @left.add(node)
			end
		end
	end

	def pre_order(string) 
		string << "#{@value}, "
		@left.pre_order(string) unless @left.nil?
		@right.pre_order(string) unless @right.nil?
		string
	end
end