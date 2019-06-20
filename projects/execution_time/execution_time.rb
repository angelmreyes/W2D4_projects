require "byebug"

def my_min_1(list) #time O(n ^ 2) #space O(1) #space complexity is independent from input size
  list.each do |ele|
    return ele if list.all? { |num| ele <= num }
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_1(list)  # =>  -5

def my_min_2(list) #O(n)
  min = list[0]
  list[1..-1].each do |ele|
    min = ele if ele < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_2(list)  # =>  -5 

def largest_contiguous_subsum(list) #O(n ^ 2)
  largest_sum = list.first
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      if j >= i && list[i..j].sum > largest_sum
        largest_sum = list[i..j].sum
      end
    end
  end
  largest_sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

def largest_contiguous_subsum(list) #O(n ^ 2)
  largest_sum = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      if j >= i 
        largest_sum << list[i..j]
      end
    end
  end
  max = largest_sum.first.sum
  largest_sum.each do |sub|
    max = sub.sum if sub.sum > max
  end
  max
end

#[[5], [5, 3], [5, 3, -7], [3], [3, -7], [-7]]
# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8 

def largest_contiguous_subsum(list)
  largest_sum = list.first
  current_sum = 0
  list.each do |ele|
    current_sum += ele
    if current_sum > largest_sum
      largest_sum = current_sum
    end
    if current_sum < 0
      current_sum = 0
    end
  end
  largest_sum
end

#list = [2, 3, -6, 7, -6, 7]
# list = [-3, -2, -1]
# p largest_contiguous_subsum(list) # => 8 

