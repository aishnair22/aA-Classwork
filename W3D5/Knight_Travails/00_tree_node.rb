class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if @parent != nil
            @parent.children.delete(self)
        end
        @parent = node
        node.children << self if node != nil
    end

    def add_child(child)
        child.parent = self
    end
    
    def remove_child(child)
        raise "Error: Is Not My Child" if !self.children.include?(child)
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result if result != nil
        end
        return nil
    end

    def bfs(target)
        queue = []
        queue << self
        until queue.empty?
            first = queue.shift
            if first.value == target
                return first
            end
            first.children.each do |child|
                queue << child
            end
        end
        return nil
    end
end
