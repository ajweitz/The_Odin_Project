require 'board'

describe Board do

	before (:example) do 
		@table = Array.new(7){ Array.new(6) } 
		@board = Board.new(@table)
	end
		
	describe 'Creates board object with given table' do
		context "when building a board without arguments" do
			it "retuns board object with a 7x6 table" do
				expect(Board.build.table).to eql(@board.table)
			end
		end
		context "when building a board with arguments 5 and 4" do
			it "returns a board object with a 5x4 table" do
				expect(Board.build(5,4).table).to eql(Array.new(5){ Array.new(4)})
			end
		end
	end



	describe "Inserting" do

		before(:each) do
			@board = Board.build
		end

		context 'when inserting "X" to 5' do
			before do
				@board.insert(5,"X")
			end
			it 'returns a table with X at [5][0]' do
				@table[5][0] = "X"
				expect(@board.table).to eql(@table)
			end
		end

		context 'when inserting "X", "O", "X" to 3 and "O" to 1' do
			before do
				@board.insert(3,"X")
				@board.insert(3,"O")
				@board.insert(3,"X")
				@board.insert(1,"O")
			end
			it 'returns a table with XOX at 3 and O at 1' do
				@table[3][0] = "X"
				@table[3][1] = "O"
				@table[3][2] = "X"
				@table[1][0] = "O"
				expect(@board.table).to eql(@table)

			end

		end

		context 'when inserting too much' do
			before do
			  8.times{@board.insert(3,"X")}
			end
			it 'returns false' do
				expect(@board.insert(3,"X")).to eql(false)
			end
		end

		context 'when inserting a value to a row that is not full' do
			
			it "returns true" do
				expect(@board.insert(0,"X")).to eq(true)
			end
		end

	end

end