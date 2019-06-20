# def first_anagram?(string1, string2) #time O(n!) #space O(1) 
#   string1.split("").permutation.to_a.include?(string2.split(""))
# end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2)#time O(n) #space O(n)
  string2 = string2.split('')
  string1.each_char do |char|
    index = string2.index(char) 
    if !index.nil?
      string2.delete_at(index)
    end
  end
  string2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(s1, s2) #time O(1) #space O(n)
  s1 = s1.split('').sort
  s2 = s2.split('').sort
  s1 == s2
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(s1, s2) #time O(n) #space O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  s1.each_char { |el| hash1[el] += 1 }
  s2.each_char { |el| hash2[el] += 1 }
  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def bonus_anagram?(s1, s2) #time O(n) #space O(n)
  hash = Hash.new(0)
  s1.each_char { |el| hash[el] += 1 }
  s2.each_char { |el| hash[el] += 1 }
  hash.all? { |k, v| v.even? }
end

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
p bonus_anagram?("elviss", "livess")    #=> true

