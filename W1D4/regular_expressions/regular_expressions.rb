# Determine whether a string contains a SIN (Social Insurance Number).
# A SIN is 9 digits and we are assuming that they must have dashes in them
def has_sin?(string)
  string.match(/\s(\d{3}-){2}\d{3}$/) ? true : false
end

puts "has_sin? returns true if it has what looks like a SIN"
puts has_sin?("please don't share this: 234-604-142") == true

puts "has_sin? returns false if it doesn't have a SIN"
puts has_sin?("please confirm your identity: XXX-XXX-142") == false
puts has_sin?("please don't share this: 234-6043-142") == false
puts has_sin?("please don't share this: 2342-604-142") == false
puts has_sin?("please don't share this: 234-604-1421") == false

# Return the Social Insurance Number from a string.
def grab_sin(string)
  sin_number = nil
  if has_sin?(string)
    sin_number = /(\d{3}-?)+/.match(string).to_s
  end
  sin_number
end

puts "grab_sin returns an SIN if the string has an SIN"
puts grab_sin("please don't share this: 234-604-142") == "234-604-142"

puts "grab_sin returns nil if it doesn't have a SIN"
puts grab_sin("please confirm your identity: XXX-XXX-142") == nil

# Return all of the SINs from a string, not just one.
def grab_all_sins(string)
  sin_numbers = []
  if has_sin?(string)
    sin_numbers = string.scan(/\d{3}-\d{3}-\d{3}/)
  end
  sin_numbers
end

puts "grab_all_sins returns all SINs if the string has any SINs"
puts grab_all_sins("234-604-142, 350-802-074, 013-630-876") == ["234-604-142", "350-802-074", "013-630-876"]

puts "grab_all_sins returns an empty Array if it doesn't have any SINs"
puts grab_all_sins("please confirm your identity: XXX-XXX-142") == []

puts "grab_all_sins returns single SIN if string has one SIN"
puts grab_all_sins("please confirm your identity: 123-456-789") == ["123-456-789"]

# Obfuscate all of the Social Insurance numbers in a string. Example: XXX-XX-4430.
def hide_all_sins(string)
  string.gsub(/(\d{3}-\d{3})/, 'XXX-XXX')
end

puts "hide_all_sins obfuscates any SINs in the string"
puts hide_all_sins("234-601-142, 350-801-074, 013-601-876") == "XXX-XXX-142, XXX-XXX-074, XXX-XXX-876"

puts "hide_all_sins does not alter a string without SINs in it"
string = "please confirm your identity: XXX-XXX-142"
puts hide_all_sins(string) == string

puts "hide_all_sins obfuscates a single SIN in the string"
puts hide_all_sins("234-601-142") == "XXX-XXX-142"

# Ensure all of the Social Insurance numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_sins(string)
  string.gsub(/(\d{3})\.?(\d{3})\.?(\d{3})/, "\\1-\\2-\\3")
end

puts "format_sins finds and reformat any SINs in the string"
puts format_sins("234600142, 350.800.074, 013-600-876") == "234-600-142, 350-800-074, 013-600-876"

string = "794314131, 143.413414, 143143.555"
puts format_sins(string) == "794-314-131, 143-413-414, 143-143-555"

puts "format_sins does not alter a string without SINs in it"
string = "please confirm your identity: 4421422"
puts format_sins(string) == string

string = "please confirm your identity: 123abc445"
puts format_sins(string) == string

# ADDING DRIVER CODE
# Adding driver code helps to solve problems because you can easily see if 
# your method is achieving the results you want.

# When you make changes, driver code allows you to check that everything is
# still working as expected. (Changes have not boken previously working code.)

# Starting with the expected results before you write a method helps to 
# clarify the purpose of the code. (Helps to simplify what is needed.)
