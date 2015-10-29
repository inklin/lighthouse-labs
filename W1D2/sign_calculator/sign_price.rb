def color_price(color_count)
  color_count >= 2 ? 10 : 15
end

def calculate_tax(total, tax_percentage)
  tax = tax_percentage.to_f / 100
  total * (1 + tax)
end

def base_price(dimension)
  dimension * 15
end

def sign_price(dimension, color_count)
  total = 0
  total += base_price(dimension)
  total += color_price(color_count)
  total += calculate_tax(total, 15)
end


puts "Price for a sign 10 square feet in dimension with 3 colors:"
puts sign_price(10, 3)