require "byebug"
#Brute Force
def bad_two_sum?(arr, target)
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            return true if idx1 < idx2 && num1 + num2 == target
        end
    end
    false
end

#time complexity: O(n^2)

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#Sorting

def okay_two_sum?(arr, target)
    sorted = arr.sort #O(nlogn)
    idx_1 = 0
    idx_2 = arr.length - 1

    until idx_2 == idx_1 # O(n)
        if sorted[idx_1] + sorted[idx_2] > target
            idx_2 -= 1
        elsif sorted[idx_1] + sorted[idx_2] == target
            return true
        elsif sorted[idx_1] + sorted[idx_2] < target
            idx_1 += 1
        end
    end
    false
end

#time complexity: O(nlogn)

# arr = [7, 5, 0, 1]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# Hash Map
def two_sum?(arr, target)
    hash = {}
    arr.each do |num|
        diff = target - num
        # return true if hash.keys.include?(diff)
        return true if hash[diff]
        hash[num] = 0 #0 can be anything, value is irrelevant
    end
    false
end

#time complexity: O(n)

arr = [7, 5, 0, 1]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false