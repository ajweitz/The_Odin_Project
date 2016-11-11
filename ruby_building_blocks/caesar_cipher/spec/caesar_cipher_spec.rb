
require 'caesar_cipher'


describe ".caesar_cipher" do
	context "given an empty string" do
		it 'returns ""' do
			expect(caesar_cipher("",4)).to eql("")
		end
	end
	context 'given "What a string!" and shift of -1' do
		it 'returns "Vgzs z rsqhmf!"' do
			expect(caesar_cipher("What a string!",-1)).to eql("Vgzs z rsqhmf!")
		end
	end
	context "given 0" do
		it 'returns the string without any change' do
			expect(caesar_cipher("What a string!",0)).to eql("What a string!")
		end
	end
	context 'given "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"' do
		it 'returns "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"' do
			expect(caesar_cipher("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG",-3)).to eql("QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD")
		end	
	end
end