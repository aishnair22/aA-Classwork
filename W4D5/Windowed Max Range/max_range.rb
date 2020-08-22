require "byebug"

def windowed_max_range(arr, w)
    best_range = arr.first
    (0..arr.length-w).each do |i|
        subarr = arr[i...i + w]
        current_max_range = subarr.max - subarr.min
        best_range = current_max_range if current_max_range > best_range
    end
    best_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
