class GraphNode
    attr_reader :value
    attr_accessor :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def self.bfs(start_node, target_value)
        queue = [start_node]
        visited_nodes = [start_node]
        until queue.empty?
            test_node = queue.pop
            return test_node if test_node.value == target_value
            test_node.neighbors.each do |neighbor|
                queue << neighbor unless visited_nodes.include?(neighbor)
                visited_nodes << neighbor
            end
        end
        nil
    end
end