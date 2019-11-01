class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.delete_if { |key_val| key_val[0] == key }
        @map << [key, value]
        value
    end

    def get(key)
        @map.each { |key_val| return key_val[1] if key_val[0] == key }
        nil
    end

    def delete(key)
        @map.each do |key_val|
            if key_val[0] == key
                value = key_val[1]
                @map.delete(key_val)
                return value
            end
        end
        nil
    end

    def show
        @map
    end
end