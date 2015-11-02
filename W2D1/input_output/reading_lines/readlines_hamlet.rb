hamlet = File.open("hamlet.txt", "r")

hamlet.readlines.each do |line|
  puts line if line.match(/^  Ham\./)
end