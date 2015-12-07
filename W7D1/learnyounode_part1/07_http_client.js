var http = require('http');
var url = process.argv[2];

http.get(url, function(res) {
  res.setEncoding('utf8');
  res.on('data', function(content) {
    console.log(content);
  });
}).on('error', function(e) {
  console.log("Got error: " + e.message);
});

// Official solution

// Since console.log is also a named function, you can simply pass it in as a callback function
// it takes in the concent and prints it to the terminal

// http.get(url, function(response) {
//   response.setEncoding('utf8');
//   response.on('data', console.log);
//   response.on('error', console.error);
// });
