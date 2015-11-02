require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
local_fname = "hamlet.txt"

File.open(local_fname, "w") {|file| file.write(open(url).read)}

# Print every 42 line to the screen
File.open(local_fname, "r") do |file|
  number = 7
  file.readlines.each_with_index do |line, index|
    puts line if index % number == number - 1
  end
end

