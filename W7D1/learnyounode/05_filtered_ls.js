var fs = require("fs");
var path = require("path");

var directory = path.normalize(process.argv[2]);
var extension = "." + process.argv[3];

fs.readdir(directory, function(err, list) {
  list.forEach(function(file){
    if (path.extname(file) === extension) {
      console.log(file);
    }
  });
});
