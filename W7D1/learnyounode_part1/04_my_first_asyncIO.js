var fs = require('fs');
var file = process.argv[2];

function countLines() {
  fs.readFile(file, function(err, content) {
    var lines = content.toString().split("\n").length - 1;
    console.log(lines);
  });
}

countLines();