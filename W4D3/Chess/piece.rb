require "singleton"

class Piece
    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
end

module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [[0, 1], [0, -1], [-1, 0], [1, 0]] #cardinals [dx, dy] == [row, col]
    DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

    def horizontal_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def valid_pos?(pos) #[x, y]
        return false if pos[0] < 0 || pos[0] > 7
        return false if pos[1] < 0 || pos[1] > 7
        true
    end

    def moves #we want to get every possible move
        all_moves = []
        self.move_dirs.each do |p_move|
            row = p_move[0]
            col = p_move[1]
            all_moves += possible_moves_in_one_direction(row, col)
        end
        all_moves
    end

    private

    def taken_areas
        current_color = self.color
        taken = []

        board.rows.flatten.each do |spot|
            if spot.symbol != nil && spot.color == current_color
                taken << spot.pos
            end
        end

        taken
    end


    def possible_moves_in_one_direction(row, col) #[0, 1]
        all_1d_moves = []
        taken_spots = taken_areas
        current_row = self.pos[0]
        current_col = self.pos[1]

        while true
            current_row = current_row + row
            current_col = current_col + col
            new_pos = [current_row, current_col]

            break if taken_spots.include?(new_pos) || !self.valid_pos?(new_pos)
            
            all_1d_moves << new_pos 
        end

        all_1d_moves
    end

end

module Stepable
    def moves
        all_moves = []
        self.move_diffs.each do |p_move|
            new_row = self.pos[0] + p_move[0]
            new_col = self.pos[1] + p_move[1]
            all_moves << [new_row, new_col]
        end
        all_moves
    end

    private
    def move_diffs
    end
end

class Rook < Piece
    include Slideable

    def move_dirs 
        horizontal_dirs
    end

    def symbol
        return :R
    end
end

class Bishop < Piece
    include Slideable

    def move_dirs 
        diagonal_dirs
    end

    def symbol
        return :B
    end
end

class Queen < Piece
    include Slideable

    def move_dirs 
        horizontal_dirs + diagonal_dirs
        
    end

    def symbol
        return :Q
    end
end

class Knight < Piece
    include Stepable
    def symbol
        return :N
    end

    def move_diffs #2d array of possible moves
        [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    end
end

class King < Piece
    include Stepable
    def symbol
        return :K
    end

    def move_diffs
        [[0, 1], [0, -1], [-1, 0], [1, 0], [1, 1], [1, -1], [-1, -1], [-1, 1]]
    end
end

class Pawn < Piece
    def symbol
        return :P
    end

    def move_dirs
        [[-1, 0], [-2, 0], [-1, 1], [-1, -1]]
    end

    private 

    def at_start_row?
        return true if self.color = :W && self.pos[0] == 6
        return true if self.color = :B && self.pos[0] == 1
        false
    end

    def forward_dir
        return -1 if self.color = :W
        return 1 if self.color = :B
    end

    def forward_steps
        self.pos[0] += forward_dir
    end

    def side_attacks
        #we did it
    end
end

class NullPiece < Piece
    include Singleton

    def initialize
        @start_pos = nil
    end

    def symbol
        return nil
    end
end
