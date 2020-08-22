require 'byebug'
#PHASE I
def first_anagram?(str_1, str_2)
    debugger
    string_arr = str_1.split('') #O(n)
    perm_arr = string_arr.permutation.to_a #O(n!)
    perm_arr.map! do |arr| #O(n!)
        arr.join('') #O(n)
    end
    perm_arr.include?(str_2) #O(n)
end

#time complexity: O(n!)

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# #PHASE II

def second_anagram?(str_1, str_2)
    str_1.each_char do |char| #O(n)
        return false if !str_2.include?(char) #O(m)
        str_2_idx = str_2.index(char) #O(m)
        str_2[str_2_idx] = ""
    end
    str_2.empty? #O(1)
end

#time complexity: O(n*m)

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# #PHASE III

def third_anagram?(str_1, str_2)
    str_1.split('').sort == str_2.split('').sort
end

#time complexity: O(nlogn)

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# #PHASE IV

# def fourth_anagram?(str_1, str_2)
#     hash_1 = Hash.new(0)
#     hash_2 = Hash.new(0)

#     str_1.each_char {|char| hash_1[char] += 1} #O(n)
#     str_2.each_char {|char| hash_2[char] += 1} #O(m)

#     hash_1 == hash_2
# end

#time complexity: O(n+m)

def fourth_anagram?(str_1, str_2)
    return false if str_1.length != str_2.length #THIS MAKES IT O(n) not O(n+m)
    hash = Hash.new(0)
    str_1.each_char {|char| hash[char] += 1} #O(n)
    str_2.each_char {|char| hash[char] -= 1} #O(m)
    hash.all? {|k,v| v == 0}
end

#time complexity: O(n+m) WITHOUT LINE 60

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true