class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.delete_if { |key_val| key_val.first == key }
        @map << [key, value]
        value
    end

    def get(key)
        @map.each { |key_val| return key_val.last if key_val.first == key }
        nil
    end

    def delete(key)
        @map.each_with_index do |key_val, idx|
            if key_val.first == key
                @map = @map[0...idx] + @map[idx+1..-1]
                return key_val.last
            end
        end
        nil
    end

    def show
        @map
    end
end