var http = require('http');
var map = require('through2-map');
var port = Number(process.argv[2]);

var server = http.createServer(function(req, res) {
  if (req.method === 'POST') {
    req.pipe(map(function (chunk) {
      return chunk.toString().toUpperCase();
    })).pipe(res);
  } else {
    res.end('Not a POST request.\n');
  }
});

server.listen(port);

// Official Solution

// var http = require('http')
// var map = require('through2-map')

// var server = http.createServer(function (req, res) {
//   if (req.method != 'POST')
//     return res.end('send me a POST\n')

//   req.pipe(map(function (chunk) {
//     return chunk.toString().toUpperCase()
//   })).pipe(res)
// })

// server.listen(Number(process.argv[2]))