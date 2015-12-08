var net = require('net');
var strftime = require('strftime');

var port = process.argv[2];
var server = net.createServer(function (socket) {
  // socket handling logic;
  // use socket.write(data) to write data to the socket
  // use socket.end() to close the socket
  // you can also use socket.end(data)
  var formatted = strftime('%Y-%m-%d %H:%M', new Date());
  socket.end(formatted);
});
server.listen(port);