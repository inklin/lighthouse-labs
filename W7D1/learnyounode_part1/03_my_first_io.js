var fs = require('fs');
var path = process.argv[2];
var content = fs.readFileSync(path);
var lines = content.toString().split("\n").length - 1;
console.log(lines);