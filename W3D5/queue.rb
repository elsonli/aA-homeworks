class Queue
    def initialize
        @queue = []
    end

    def enqueue(ele)
        @queue << ele
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

    def show
        @queue.dup
    end

    def size
        @queue.length
    end

    def empty?
        @queue.empty?
    end
end