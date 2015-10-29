def count_letters(text)
  letters = text.scan(/[^\s]/)
  letter_count = Hash.new(0)
  letters.uniq.each do |letter|
    letter_count[letter] = letters.count(letter)
  end

  puts letter_count
end

count_letters("lighthouse in the house...")

def count_indices(text)
  letters = text.scan(/[^\s]/)
  letter_count = Hash.new()

  letters.each_with_index do |letter, index|
    if letter_count[letter].nil?
      letter_count[letter] = []
    else
      letter_count[letter] << index
    end
  end

  puts letter_count

end

count_indices("lighthouse in the house...")