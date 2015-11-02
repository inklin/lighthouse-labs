# opening a file in w mode truncates the file if it exists
# and creates a new file if it does not exist
require "open-uri"

remote_url = "http://example.org"

remote_data = open(remote_url).read
my_local_file = File.open("my-downloaded-page.html", "w")
my_local_file.write(remote_data)
my_local_file.close