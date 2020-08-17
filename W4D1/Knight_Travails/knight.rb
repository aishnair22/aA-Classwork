require_relative "00_tree_node.rb"
class KnightPathFinder
    attr_reader :considered_positions
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        self.build_move_tree
    end

    def self.valid_moves(pos)
        x, y = pos
        all_valid_moves = [[x - 2, y - 1], [x - 2, y + 1], [x + 2, y - 1], [x + 2, y + 1], [x - 1, y - 2], [x + 1, y - 2], [x - 1, y + 2], [x + 1, y + 2]]
        all_valid_moves.select do |position|
            a,b = position
            if a < 8 && a >= 0 && b < 8 && b >= 0
                position
            end
        end
    end

    def new_move_positions(pos)
        all_moves = KnightPathFinder.valid_moves(pos)
        new_moves = []
        all_moves.each do |move|
            if !@considered_positions.include?(move)
                new_moves << move
                @considered_positions << move
            end
        end
        new_moves
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            current = queue.shift
            new_positions = new_move_positions(current.value)
            new_positions.each do |position|
                child = PolyTreeNode.new(position)
                child.parent = current
                current.add_child(child)
                queue << child
            end
        end
    end


    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    #ITERATIVE WAY:
    # def trace_path_back(end_node)
    #     path = []
    #     node = end_node
    #     until node == @root_node
    #         path << node.value
    #         node = node.parent
    #     end
    #     path << node.value
    #     return path.reverse
    # end

    #RECURSIVE WAY:
    def trace_path_back(end_node)
        return [@root_node.value] if end_node == @root_node
        trace_path_back(end_node.parent) + [end_node.value]
    end
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]