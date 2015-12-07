var filter = require('./06_module.js');
var directory = process.argv[2];
var ext = process.argv[3];

filter(directory, ext, function(error, list) {
  if (error) {
    console.log(error);
  }

  list.forEach(function (file) {
    console.log(file);
  })
});