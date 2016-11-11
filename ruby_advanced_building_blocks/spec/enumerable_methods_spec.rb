require 'enumerable_methods'


describe 'test enumerable_methods' do
	let(:numbers_array) { [2,3,4,5,1,2,6,40,-2,20,-30,5,8] }
	let(:positive_array) { [2,3,4,5,1,2,6,40,2,20,30,5,8] }
	let(:empty_array) { [] }

	describe '.my_each' do
		context 'when given empty array' do
			it 'prints nothing' do
				expect{empty_array.my_each{|i| puts i}; print("")}.to output("").to_stdout
			end
		end
		context 'when printing each member' do
			it 'prints all the members ' do
				expect{numbers_array.my_each{|i| print i}}.to output("234512640-220-3058").to_stdout
			end
		end
	end

	describe '.my_select' do
		context 'when selecting between 2 and 6' do
			it 'returns array with numbers between 2 and 6' do
				expect(numbers_array.my_select{|s| s >= 2 && s <= 6}).to eql([2,3,4,5,2,6,5])
			end
		end	  
	end

	describe '.my_count' do
	  context 'when counting an array' do
	  	it 'retrns the number of elements in the array' do
	  		expect(numbers_array.my_count).to eql(numbers_array.size)
	  	end
	  end

	  context 'when counting numbers bigger than 0' do
	  	it 'returns the number of elements bigger than 0' do
	  		expect(numbers_array.my_count{|n| n>0}).to eql(numbers_array.size-2)
	  	end
	  end
	end

  describe '.my_map' do
  	context 'when giving same input to map' do
	    it 'returns same result as .map' do
	    	expect(numbers_array.my_map{|n| n**2 }).to eql(numbers_array.map{|n| n**2 })
	    end
  	end
  end

  describe '.my_map_ver2' do
  	context 'when giving same input to map' do
	  	it 'returns same result as .map' do
    		expect(numbers_array.my_map_ver2{|n| n**2 }).to eql(numbers_array.map{|n| n**2 })
    	end
    end
  end

  describe '.my_any?' do
  	context 'when giving a matching pattern' do
  		it 'returns true' do
		    expect(numbers_array.my_any?{|n| n>1}).to eql(true)
  		end
  	end
  	context 'when giving a non-mathcing pattern' do
  		it 'returns false' do
		    expect(numbers_array.my_any?{|n| n<-30}).to eql(false) 
  		end
  	end
  end
end