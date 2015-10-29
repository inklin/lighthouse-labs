def to_roman(num)
  roman_numerals = {
    1 => {
      symbol: 'I',
      count: get_ones(num)
      },
    5 => {
      symbol: 'V',
      count: get_fives(num)
      },
    10 => {
      symbol: 'X',
      count: get_tens(num)
      },
    50 => {
      symbol: 'L',
      count: get_fifties(num)
      },
    100 => {
      symbol: 'C',
      count: get_hundreds(num)
      },
    500 => {
      symbol: 'D',
      count: get_five_hundreds(num)
      },
    1000 => {
      symbol: 'M',
      count: get_thousands(num)
      }
  }

  nonzero_counts = roman_numerals.values.select { |value| value[:count] > 0}

  converted_number = ""

  nonzero_counts.reverse.each do |hash|
    hash[:count].times do
      converted_number << hash[:symbol]
    end
  end
  
  converted_number
end

def get_thousands(num)
  num / 1000
end

def get_five_hundreds(num)
  (num % 1000) / 500
end

def get_hundreds(num)
  (num % 500) / 100
end

def get_fifties(num)
  (num % 100) / 50
end

def get_tens(num)
  (num % 50) / 10
end

def get_fives(num)
  (num % 10) / 5
end

def get_ones(num)
  (num % 5)
end
 
# Drive code... this should print out trues.
 
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"
 
# TODO: what other cases could you add to ensure your to_roman method is working?

puts to_roman(5600)