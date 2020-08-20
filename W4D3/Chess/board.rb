require_relative "piece.rb"

class Board
    attr_accessor :rows, :sentinel

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def initialize #black on top, white on bottom
        @sentinel = NullPiece.instance
        @rows = Array.new(8){Array.new(8, @sentinel)}
        self.fill_board
    end

    def valid_pos?(pos) #[x, y]
        return false if pos[0] < 0 || pos[0] > 7
        return false if pos[1] < 0 || pos[1] > 7
        true
    end

    def move_piece(start_pos, end_pos) #may need color as an input
        raise "Invalid start position" if !valid_pos?(start_pos)
        raise "Invalid end position" if !valid_pos?(end_pos)
        raise "No piece at start position" if self[start_pos] == @sentinel
        piece_value = self[start_pos]
        self[end_pos] = piece_value
        self[start_pos] = @sentinel
    end

    def fill_board #fill with instances of the pieces, in display board we just show the symbols
        @rows[0].each_with_index do |b_piece, j|
            if j == 0 || j == 7 #Rook
                @rows[0][j] = Rook.new(:B, @rows, [0, j])
            elsif j == 1 || j == 6 #Knight
                @rows[0][j] = Knight.new(:B, @rows, [0, j])
            elsif j == 2 || j == 5 #Bishop
                @rows[0][j] = Bishop.new(:B, @rows, [0, j])
            elsif j == 3 #Queen
                @rows[0][j] = Queen.new(:B, @rows, [0, j])
            else
                @rows[0][j] = King.new(:B, @rows, [0, j])
            end
        end
        
        @rows[1].each_with_index do |b_pawn, j|
            @rows[1][j] = Pawn.new(:B, @rows, [1, j])
        end

        @rows[6].each_with_index do |w_pawn, j|
            @rows[6][j] = Pawn.new(:W, @rows, [6, j])
        end

        @rows[7].each_with_index do |w_piece, j|
            if j == 0 || j == 7 #Rook
                @rows[7][j] = Rook.new(:W, @rows, [7, j])
            elsif j == 1 || j == 6 #Knight
                @rows[7][j] = Knight.new(:W, @rows, [7, j])
            elsif j == 2 || j == 5 #Bishop
                @rows[7][j] = Bishop.new(:W, @rows, [7, j])
            elsif j == 3 #Queen
                @rows[7][j] = Queen.new(:W, @rows, [7, j])
            else
                @rows[7][j] = King.new(:W, @rows, [7, j])
            end
        end   
    end

    def render
        new_board = @rows.map do |row|
            row.map do |ele|
                ele.symbol
            end
        end

        new_board.each do |row|
            p row
        end
    end

    
end

test = Board.new
# p test.rows
test.render
puts "-------------------------------"
# test.move_piece([0,0], [0,4])
# test.render
# puts "-------------------------------"
# test.move_piece([3,3], [1,0])
# test.render

rook = Rook.new(:B, test, [4,4])
p rook.moves