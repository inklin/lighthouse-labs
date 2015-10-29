# must be baller and either furnished or rent cheaper than 2100
def rent?(furnished, rent, baller)
  baller && (furnished || rent < 2100)
end

###
# Add your "test" ("driver") code below in order to "test drive" (run) your method above...
# The test code will call the method with different permutations of options and output the result each time.
###

# yes
puts "Furnished, Baller, with rent > 2100:"
puts "#{rent?(true, 3000, true)}"

# yes
puts "Furnished, Baller, with rent < 2100:"
puts "#{rent?(true, 1000, true)}"

# yes
puts "Furnished, not Baller, with rent > 2100"
puts "#{rent?(true, 3000, false)}"


puts "Furnished, not Baller, with rent < 2100"
puts "#{rent?(true, 1000, false)}"

# yes
puts "Not Furnished, Baller, with rent > 2100"
puts "#{rent?(false, 3000, true)}"

# yes 
puts "Not Furnished, Baller, with rent < 2100"
puts "#{rent?(false, 1000, true)}"

# yes
puts "Not Furnished, not Baller, with rent > 2100:"
puts "#{rent?(false, 3000, false)}"

puts "Not Furnished, not Baller, with rent < 2100"
puts "#{rent?(false, 1000, false)}"