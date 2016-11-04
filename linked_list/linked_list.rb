require_relative './node'

class LinkedList

	attr_reader :head, :tail

	def initialize head = nil, tail = nil
		@head = head
		@tail = tail
	end

	def self.build(value)
		node = (Node.new value)
		new node, node
	end


	def append(value)
		@tail.next_node = Node.new(value)
		@tail = @tail.next_node
	end

	def prepend(value)
		node = Node.new(value, @head)
		@head = node
	end

	def at(index)
		at2(index).value
	end

	def pop
		node = @head
		popped = @tail
		if @head == @tail
			@head = @tail = nil
			return popped
		end
		until node.next_node == @tail
			node = node.next_node
		end
		node.next_node = nil
		@tail = node
		popped
	end

	def find(data)
		node = @head
		i = 0
		until node.nil?
			return i if node.value == data
			node = node.next_node
			i+=1
		end
		nil
	end

	def contains?(value)
		!find(value).nil?
	end

	def insert_at(index, value)
		node = @head
		if index == 0
			prepend(value)
		else
			node = at2(index-1)
			new_node = Node.new(value,node.next_node)
			node.next_node = new_node
		end
	end

	def remove_at(index)
		node = @head
		if index == 0
			prepend(value)
		else
			node = at2(index-1)
			node.next_node = node.next_node.next_node
		end
	end

	def to_s
		node = @head
		str = ""
		until node.nil?
			str << "#{node.value} -> "
			node = node.next_node
		end 
		str << "nil"
	end


	private
	# returns node instead of value
	def at2(index)
		node = @head
		index.times{ node = node.next_node}
		node
	end
end