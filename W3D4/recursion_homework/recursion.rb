# Calculate the sum from 1 to n (inclusive)
def sum_to(num)
    return nil if num < 1
    return 1 if num == 1
    num + sum_to(num - 1)
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

# Calculate the sum of an array of Integers
def add_numbers(arr)
    return nil if arr.empty?
    return arr.first if arr.length == 1
    arr.last + add_numbers(arr[0...-1])
end

# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

# Solve the Gamma Function
def gamma_fnc(num)
    return nil if num == 0
    return 1 if num == 1
    (num - 1) * gamma_fnc(num - 1)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

# Determine if an array of ice cream flavors contains a user's favorite flavor
def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors.first == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

# Reverse a string
def reverse(str)
    return "" if str.empty?
    str[-1] + reverse(str[0...-1])
end

# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""