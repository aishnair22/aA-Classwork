require "rspec"
require "towers"

describe Towers do 
    subject(:tower) {Towers.new}
    describe "#initialize" do
        it "creates 3 arrays" do 
            expect(tower.piles.length).to eq(3)
        end

        it "fills one of the arrays with discs" do 
            expect(tower.piles).to eq([[1,2,3], [], []])
        end
    end

    describe "#move" do
        it "moves a disc from one pile to another" do
            expect{tower.move(0, 2)}.not_to raise_error(ArgumentError)
        end

        it "does not move a bigger disc onto top of smaller disc" do
            tower.move(0, 1)
            tower.move(0, 2)
            expect{tower.move(2, 1)}.to raise_error(ArgumentError)
        end

        it "only moves top disc from pile" do
            tower.move(0, 1)
            expect(tower.piles).to eq([[2, 3], [1], []])
        end

        it "cannot move from empty pile" do
            expect{tower.move(1, 2)}.to raise_error(ArgumentError)
        end

    end
    
    describe "#won?" do
        it "game is won when all discs are moved to either pile 2 or 3" do
            tower.move(0, 1)
            tower.move(0, 2)
            tower.move(1, 2)
            tower.move(0, 1)
            tower.move(2, 0)
            tower.move(2, 1)
            tower.move(0, 1)
            expect(tower.won?).to eq(true)
        end
    end


end