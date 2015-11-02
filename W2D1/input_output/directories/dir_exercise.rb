dir_path = "/vagrant/Work/"
dir_name = "lighthouse_labs"

files = Dir.glob("#{dir_path}#{dir_name}/**/*.*")

# sorted in descending order of file size
sorted_files = files.sort_by { |filename| -File.size(filename)}
top_10 = sorted_files[0..9]

count = 1
puts "Here are the 10 largest files in #{dir_name}:"
top_10.each do |filename|
  puts "#{count}. #{filename}: #{File.size(filename)}"
  count += 1
end