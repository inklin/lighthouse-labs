dir_path = "/vagrant/Work/"
dir_name = "lighthouse_labs"

files = Dir.glob("#{dir_path}#{dir_name}/**/*.*")
files_summary = Hash.new

files.each do |filename|
  file_type = File.basename(filename).split(".").last
  file_size = File.size(filename)
  files_summary[file_type] = Hash.new(0) if files_summary[file_type].nil?
  files_summary[file_type][:count] += 1
  files_summary[file_type][:total_size] += file_size
end

puts "Filetype\tCount\tBytes"

File.open("file-analysis.txt", "w") do |f|
  files_summary.each do |filetype, info|
    puts filetype + "\t" + info[:count].to_s + "\t" + info[:total_size].to_s
  end
end

# desired format
# files_summary = {
#   'rb' => 
#     {
#     count: INT
#     total_size: INT
#   },
#   'txt' => 
#     {
#     count: INT
#     total_size: INT
#   }
# }