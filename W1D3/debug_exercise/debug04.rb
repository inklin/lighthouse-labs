require 'pry'

def char_count(list)
  letters = Hash.new(0)
  list.each do |word|
    word.split('').each { |letter| letters[letter] += 1 }
    binding.pry
    puts letters
  end
  letters
end

# Why the long face(error)? 
# 1. This should return count of each letter in the list

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?

def char_count_improved(list)
  letter_count = Hash.new(0)
  letters = list.join.scan(/\w/)
  unique_letters = letters.uniq

  unique_letters.each { |letter| letter_count[letter] =  string.count(letter)}


  letters
end

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])
