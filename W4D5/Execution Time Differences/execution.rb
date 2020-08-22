#My Min

#PHASE I
def my_min_1(list)
    min = list.first
    list.each_with_index do |num_1, idx_1|
        list.each_with_index do |num_2, idx_2|
            if min > num_2 && idx_1 < idx_2
                min = num_2
            end
        end
    end
    min
end

#time complexity: O(n^2)

#PHASE II
def my_min_2(list)
    min = list.first
    list.each do |num|
        if num < min 
            min = num
        end
    end
    min
end

#time complexity: O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5

#Largest Contiguous Sub-sum

#PHASE I

def largest_contiguous_subsum_1(list)
    subs = []
    (0...list.length).each do |idx|  #O(n)
        (idx...list.length).each do |idx_2| #O(n)
            subs << list[idx..idx_2] #O(n)
        end
    end
    max = list.first
    subs.each do |subarr|
        if subarr.sum > max
            max = subarr.sum
        end
    end
    max
end

#time complexity: O(n^3) -- n^3 + n => n^3

#PHASE II

def largest_contiguous_subsum_2(list)
    largest_sum = list.first
    current_sum = 0
    list.each do |ele| 
        current_sum += ele
        if current_sum > largest_sum
            largest_sum = current_sum
        end
        current_sum = 0 if current_sum < 0  
    end
    largest_sum
end

#time complexity: O(n)

list1 = [5, 3, -7]
p largest_contiguous_subsum_2(list1) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
p largest_contiguous_subsum_2(list3) # => -1 (from [-1])
