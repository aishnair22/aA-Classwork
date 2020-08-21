class Towers
    attr_accessor :piles
    def initialize
        @piles = [[1,2,3], [], []]
    end

    def move(start_pile, end_pile)
        raise ArgumentError if @piles[start_pile].empty?
        if @piles[end_pile].first != nil
            raise ArgumentError if @piles[start_pile].first > @piles[end_pile].first
        end
        disc = @piles[start_pile].shift
        @piles[end_pile].unshift(disc)
    end

    def won?
        @piles[0].empty? && (@piles[1].length == 3 || @piles[2].length == 3)
    end

end