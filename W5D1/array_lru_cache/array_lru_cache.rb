class ArrayLRUCache
    def initialize(max_storage)
      @underlying_array = []
      @max_storage = max_storage
    end

    # Returns the number of elements currently in cache
    def count
      underlying_array.length
    end

    # Adds element to cache according to LRU principle
    def add(ele)
      # Just need to add the element to the cache if the cache is not full
      if count < max_storage
        underlying_array << ele
        return ele
      end

      # 1. Check if the element already exists inside of the cache
      # 2. Remove the first element if it exists, otherwise delete it from the cache
      # 3. Append the element to the back of the cache
      search_idx = underlying_array.index(ele)
      search_idx.nil? ? underlying_array.shift : underlying_array.delete_at(search_idx)
      underlying_array.push(ele)
    end

    # Shows the items in the cache, with the LRU item first
    # The cache is already in the order from LRU to MRU
    def show
      underlying_array.dup
    end

    private
    # helper methods go here!
    attr_reader :max_storage
    attr_accessor :underlying_array

  end

  johnny_cache = ArrayLRUCache.new(4)

  johnny_cache.add("I walk the line")   # ["I walk the line"]
  johnny_cache.add(5)                   # ["I walk the line", 5]

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])             # ["I walk the line", 5, [1, 2, 3]]
  johnny_cache.add(5)                   # ["I walk the line", [1, 2, 3], 5]
  johnny_cache.add(-5)                  # ["I walk the line", [1, 2, 3], 5, -5]
  johnny_cache.add({a: 1, b: 2, c: 3})  # [[1, 2, 3], 5, -5, {a: 1, b: 2, c: 3}]
  johnny_cache.add([1,2,3,4])           # [5, -5, {a: 1, b: 2, c: 3}, [1, 2, 3, 4]]
  johnny_cache.add("I walk the line")   # [-5, {a: 1, b: 2, c: 3}, [1, 2, 3, 4], "I walk the line"]
  johnny_cache.add(:ring_of_fire)       # [{a: 1, b: 2, c: 3}, [1, 2, 3, 4], "I walk the line", :ring_of_fire]
  johnny_cache.add("I walk the line")   # [{a: 1, b: 2, c: 3}, [1, 2, 3, 4], :ring_of_fire, "I walk the line"]
  johnny_cache.add({a: 1, b: 2, c: 3})  # [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {a: 1, b: 2, c: 3}]


  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]