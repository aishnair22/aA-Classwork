require "rspec"
require "tdd"

describe "#my_uniq" do

    it "removes duplicate elements from the array" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
        expect(my_uniq([2, 3, 5, 1, 4, 1, 2])).to eq([2, 3, 5, 1, 4])
    end

    it "should not use Array#uniq" do
        array = [1, 2, 1, 3, 3]
        expect(array).to_not receive(:uniq)
        my_uniq(array)
    end

    it "should return a new array" do 
        expect(my_uniq([1, 2, 1, 3, 3])).to_not be([1, 2, 3])
    end
end

describe Array do

    subject(:array) {[-1, 0, 2, -2, 1]}

    describe "#two_sum" do

        it "return positions of pairs that sum to zero" do 
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "each of the pairs has to be sorted smaller index before bigger index" do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "pairs to be sorted dictionary-wise" do
            expect([-2, 1, 2, 2].two_sum).to eq([[0, 2], [0, 3]])
        end
        
    end

end

describe "#my_transpose" do 
    it "convert rows to columns for a matrix" do 
        matrix = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]
        expect(my_transpose(matrix)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end

describe "#stock_picker" do

    stocks = [3, 5, 20, 1, 10] 

    it "output the most profitable pair of days" do
        expect(stock_picker(stocks)).to eq([0, 2])
    end

    it "cannot sell stock before buying" do
        expect(stock_picker(stocks)).to_not eq([3, 2])
    end


end
