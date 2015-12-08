var http = require('http');
var fs = require('fs');
var port = Number(process.argv[2]);
var file = process.argv[3];

var server = http.createServer(function(req, res) {
  // add status 200 to the response head and type of data
  res.writeHead(200, {'content-type', 'text/plain'});
  // read the file and pipe the data to the response
  fs.createReadStream(file).pipe(res);
});

server.listen(port);