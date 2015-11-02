file = File.open("bacon.txt", "r")

# .eof is a File method, returns TRUE if no more data
# in the file to read
while !file.eof?
  # readline method reads a single line at a time
  line = file.readline
  puts line
end

# note that readlines loads the entire file at once
# this is not a good idea if your file is large, 
# use readline instead

# Use readline: when you aren't operating on the entirety
# of the file contents at once, and you don't need to store
# the entirety of each line either