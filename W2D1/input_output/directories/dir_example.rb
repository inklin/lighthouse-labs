# count the files in my reading lines directory
dir_path = "/vagrant/Work/lighthouse_labs/W2D1/input_output/"
dir_name = "reading_lines"

file_count = Dir.glob("#{dir_path}#{dir_name}/*").length
puts "Total number of files in #{dir_name}: #{file_count}."

txt_count = Dir.glob(dir_path + dir_name + "/*.txt").join(",\n")
puts "Here's a list of txt files in #{dir_name}:"
puts txt_count