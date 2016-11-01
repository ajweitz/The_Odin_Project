module Fibonacci


	def self.fibs(n)
		fibonacci=[1,1]
		(n-2).times{ |i| fibonacci << (fibonacci[i]+fibonacci[i+1])}

		n>1 ? fibonacci : [1]
	end

	def self.fibs_rec(n)
		n <= 1 ? [n] : fibs_rec(n-1) << fibs_rec(n-1)[-1] + fibs_rec(n-2)[-1]
	end


end