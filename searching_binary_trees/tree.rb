require_relative './node'

class Tree

	def initialize root
		@root = root		
	end

	def self.build(value)
		return build_tree(value) if value.is_a?(Array)
		new Node.new(value)
	end


	def add(value)
		@root.add(Node.new(value))
	end

	def pre_order
		string = @root.pre_order("")
		puts string.chomp(", ")
	end

	def breadth_first_search(value)
		queue = Queue.new
		queue << @root
		until queue.empty?
			node = queue.pop
			return node if node.value == value
			queue << node.left unless node.left.nil?
			queue << node.right unless node.right.nil?
		end
		nil
	end

	def depth_first_search(value)
		stack = [@root]
		until stack.empty?
			node = stack.pop
			return node if node.value == value
			stack.push(node.right) unless node.right.nil?
			stack.push(node.left) unless node.left.nil?
		end
		nil
	end

	def dfs_rec(value)
		dfs_rec2(value,@root)
	end

	private

	def dfs_rec2(value, node)
		return node if node.nil? || value == node.value
		dfs_rec2(value, node.left) || dfs_rec2(value, node.right)
	end

	def self.build_tree(array)
		tree = build(array[0])
		array[1..-1].each{ |value| tree.add(value) }
		tree
	end

end