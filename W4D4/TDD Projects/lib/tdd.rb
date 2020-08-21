def my_uniq(arr)
    new_arr = []

    arr.each do |ele|
        if !new_arr.include?(ele)
            new_arr << ele
        end
    end

    new_arr
end

class Array
    def two_sum
        pairs = []
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                pairs << [i, j] if self[i] + self[j] == 0 && j > i
            end
        end
        pairs
    end
end

def my_transpose(matrix)
    transposed = []
    (0...matrix.length).each do |idx_1|
        row = []
        (0...matrix.length).each do |idx_2|
            row << matrix[idx_2][idx_1]
        end
        transposed << row
    end

    transposed 
end

def stock_picker(arr)
    best_pair = []
    biggest_diff = 0

    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            diff = arr[j] - arr[i]
            if diff > biggest_diff && j > i
                biggest_diff = diff
                best_pair = [i, j]
            end
        end
    end

    best_pair
end
