class Board
    attr_accessor :rows

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
        fill_board
    end

    def fill_board
        @rows[0].each_with_index do |b_piece, j|
            if j == 0 || j == 7 #Rook
                b_piece = Rook.new(:B, @rows, [0, j])
            elsif j == 1 || j == 6 #Knight
                b_piece = Knight.new(:B, @rows, [0, j])
            elsif j == 2 || j == 5 #Bishop
                b_piece = Bishop.new(:B, @rows, [0, j])
            elsif j == 3 #Queen
                b_piece = Queen.new(:B, @rows, [0, j])
            else
                b_piece = King.new(:B, @rows, [0, j])
            end
        end
        
        @rows[1].each_with_index do |b_pawn, j|
            b_pawn = Pawn.new(:B, @rows, [1, j])
        end

        @rows[6].each_with_index do |w_pawn, j|
            w_pawn = Pawn.new(:W, @rows, [6, j])
        end

        @rows[7].each_with_index do |w_piece, j|
            if j == 0 || j == 7 #Rook
                w_piece = Rook.new(:W, @rows, [7, j])
            elsif j == 1 || j == 6 #Knight
                w_piece = Knight.new(:W, @rows, [7, j])
            elsif j == 2 || j == 5 #Bishop
                w_piece = Bishop.new(:W, @rows, [7, j])
            elsif j == 3 #Queen
                w_piece = Queen.new(:W, @rows, [7, j])
            else
                w_piece = King.new(:W, @rows, [7, j])
            end
        end
        
    end
end

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
end

class Queen < Piece
    def initialize
        super
    end
end

class King < Piece
    def initialize
        super
    end
end

class Pawn < Piece
    def initialize
        super
    end
end

class Knight < Piece
    def initialize
        super
    end
end

class Bishop < Piece
    def initialize
        super
    end
end

class Rook < Piece
    def initialize
        super
    end
end


test = Board.new
p test.rows