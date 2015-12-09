var file = process.argv[2];
var fs = require('fs');
fs.createReadStream(file).pipe(process.stdout);