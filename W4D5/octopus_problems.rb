fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths
# to all other fish lengths.
def sluggish_octopus(fish_array)
  longest_fish = nil
  fish_array.each do |fish_1|
    fish_array.each do |fish_2|
      if fish_1.length > fish_2.length
        longest_fish = fish_1
      else
        longest_fish = fish_2
      end
    end
  end
  longest_fish
end

puts "Nested Loop Result: #{sluggish_octopus(fish_array)}" # "fiiiissshhhhhh"

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm
# that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O
# is classified by the dominant term.
def dominant_octopus(fish_array)
  return fish_array if fish_array.length <= 1
  middle_idx = fish_array.length / 2
  left_array = fish_array[0...middle_idx]
  right_array = fish_array[middle_idx..-1]
  sorted_left_array = dominant_octopus(left_array)
  sorted_right_array = dominant_octopus(right_array)
  merge_fish_arrays(sorted_left_array, sorted_right_array)
end

def merge_fish_arrays(fish_array_1, fish_array_2)
  merged_fish_array = []
  until fish_array_1.empty? || fish_array_2.empty?
    if fish_array_1.first.length < fish_array_2.first.length
      merged_fish_array << fish_array_1.shift
    else
      merged_fish_array << fish_array_2.shift
    end
  end
  merged_fish_array + fish_array_1 + fish_array_2
end

merge_sort_result = dominant_octopus(fish_array)
puts "Merge Sort Result: #{merge_sort_result.last}" # "fiiiissshhhhhh"

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest
# fish that you have found so far while stepping through the array only once.
def clever_octopus(fish_array)
  longest_fish = fish_array.first
  counter = 1
  while counter < fish_array.length
    current_fish = fish_array[counter]
    longest_fish = current_fish if current_fish.length > longest_fish.length
    counter += 1
  end
  longest_fish
end

puts "Linear Pass Result: #{clever_octopus(fish_array)}" # "fiiiissshhhhhh"

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles
# in the following directions:
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down",
               "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding
# tentacle. We can assume that the octopus's eight tentacles are numbered and
# correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.
def slow_dance(tile, tiles_array)
  tiles_array.each_with_index do |test_tile, idx|
    return idx if tile == test_tile
  end
end

puts "Linear Pass Result: #{slow_dance("up", tiles_array)}" # 0
puts "Linear Pass Result: #{slow_dance("right-down", tiles_array)}" # 3

# Constant Dance
# Now that the octopus is warmed up, let's help her dance faster. Use a
# different data structure and write a new function so that you can access the
# tentacle number in O(1) time.
def fast_dance(tile, tile_to_idx_hash)
  tile_to_idx_hash[tile]
end

def hash_from_array(array)
  hash = Hash.new
  array.each_with_index { |tile, idx| hash[tile] = idx }
  hash
end

tile_to_idx_hash = hash_from_array(tiles_array)
puts "Constant Time Result: #{fast_dance("up", tile_to_idx_hash)}" # 0
puts "Constant Time Result: #{fast_dance("right-down", tile_to_idx_hash)}" # 3