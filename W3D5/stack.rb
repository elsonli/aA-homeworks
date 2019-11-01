class Stack
    def initialize
        @stack = []
    end

    def push(ele)
        @stack << ele
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end
end