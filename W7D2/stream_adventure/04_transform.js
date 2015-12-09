var through = require('through2');
var transform = through(write, end);

function write (buffer, encoding, next) {
  this.push(buffer.toString().toUpperCase());
  next();
}

function end (done) {
  done();
}

process.stdin.pipe(transform).pipe(process.stdout);

// Here is the reference solution:

var through = require('through2');
var tr = through(function (buf, _, next) {
    this.push(buf.toString().toUpperCase());
    next();
});
process.stdin.pipe(tr).pipe(process.stdout);

