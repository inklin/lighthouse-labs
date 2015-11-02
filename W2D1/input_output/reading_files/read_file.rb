file = File.open("sample.txt", "w")
text = "Biscuit candy canes jelly beans sweet roll. Ice cream sugar plum topping topping topping jelly jujubes lollipop soufflé. Tart macaroon tart ice cream jujubes. Muffin apple pie marshmallow. Jelly beans liquorice apple pie gingerbread danish cupcake pudding caramels liquorice. Ice cream chupa chups oat cake. Cake carrot cake chocolate cake danish cookie jujubes cotton candy candy."
file.write(text)
file.close

open_file = File.open("sample.txt", "r")

# this read call starts at the end of the file and grabs all of the file's contents
contents = open_file.read

puts contents 

# this one will be empty because every read operation starts where the last read
# operation ended

# since we have already read through the entire file, the second read call has nothing
# left to read --> think of it like a cursor moving through a file
contents = open_file.read
puts contents 