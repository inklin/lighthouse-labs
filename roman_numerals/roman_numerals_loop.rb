def to_roman(num)

  roman_numerals = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }

  converted = ""

  roman_numerals.each do |number, symbol|
    if num >= number
      count = num / number
      converted << (symbol * count)
      num = num % number
    end
  end

  converted
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"
 
# TODO: what other cases could you add to ensure your to_roman method is working?
puts to_roman(4010) == "MMMMX"
puts to_roman(241) == "CCXXXXI"
puts to_roman(34) == "XXXIIII"

## Modern Roman Numerals

puts "My totally sweet testing script"
puts ""
puts "input | expected | actual"
puts "------|----------|-------"
puts "4     | IV       | #{to_roman(4)}"
puts "9     | IX       | #{to_roman(9)}"
puts "13    | XIII     | #{to_roman(13)}"
puts "1453  | MCDLIII  | #{to_roman(1453)}"
puts "1646  | MDCXLVI  | #{to_roman(1646)}"