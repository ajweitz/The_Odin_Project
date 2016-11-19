require 'game'
require 'board'

describe Game do

	before (:example) do 
		@game = Game.build 
		@board = Board.build
	end

	describe 'initialize Game' do
		context '.build' do
			it 'initializes Game object with a board' do
				expect(@game.board).to eql(@board)
			end
		end
	end

	describe '.insert' do

	  context 'when inserting to 1,1,5,0,2,5,1 etc...' do
	  	before do
	  		@values = [1,1,5,0,2,5,1,6,6,6,6,5,3]
	  	end
	  	it 'inserts ⚫ and ⚪ to the table' do
	  		@values.each_with_index do |v,i|
	  	  	expect(@game.insert(v)).to eql(true)
	  	  	i % 2 == 0 ? @board.insert(v,"⚫") : @board.insert(v,"⚪")
		  		expect(@game.board).to eql(@board)
	  	  end
	  	end
	  end
	end

	describe '.state' do

		before(:each) do
			@game = Game.build 
		end

		context 'when the game is not yet finished' do
			before do
			  @values = [1,1,1,1,1,1,0,0,0,0,0,2,2,2,2,2,2,4,4,4,5,5,5,5,5,5,6,6,6,6]
			end

			it "returns Game.NOT_FINISHED" do
				@values.each do |v|
					@game.insert(v)
					expect(@game.state).to eql(Game::NOT_FINISHED)
				end
			end
	  end

	  context 'when the game is drawn' do
	  	before do
	  		3.times do |i|
		  	  6.times{ @game.insert(i)}
	  		end
	  		@game.insert(6)
	  		4.times do |i|
	  			6.times{@game.insert(i+3)}
	  		end
	  	end
	  	it 'returns Game.DRAW' do
	  		expect(@game.state).to eql(Game::DRAW)
	  	end
	  end	 

	  describe "when the red win" do
	 		before(:each) do
				@game = Game.build 
			end
	  	context "When there are 4 in one row" do
	  		before do
		  		3.times do |i|
		  			2.times{@game.insert(i)}
		  		end
		  		@game.insert(3)
	  		end
	  		it 'returns Game.RED_WON' do
	  			expect(@game.state).to eql(Game::RED_WON)
	  		end
	  	end

	  	context "When there are 4 in one column" do
	  		before do
		  		3.times do
		  			@game.insert(3)
		  			@game.insert(4)
		  		end
		  		@game.insert(3)
	  		end
	  		it 'returns Game.RED_WON' do
		  		# puts @game
	  			expect(@game.state).to eql(Game::RED_WON)
	  		end
	  	end

	  	context "When there are 4 in a diagonal" do
	  		before do
		  		@game.insert(2)
		  		2.times{ @game.insert(3) }
		  		@game.insert(2)
		  		3.times{ @game.insert(4) }
		  		4.times{ @game.insert(5) }
	  		end
	  		it 'returns Game.RED_WON' do
		  		# puts @game
	  			expect(@game.state).to eql(Game::RED_WON)
	  		end
	  	end

	  end
	end

end