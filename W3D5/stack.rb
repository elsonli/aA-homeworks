class Stack
    def initialize
        @stack = []
    end

    def push(ele)
        @stack << ele
        self
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end

    def size
        @stack.length
    end

    def empty?
        @stack.empty?
    end
end