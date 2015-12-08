var path = require('path');
var fs = require('fs');

module.exports = function(dir, extString, callback) {

  fs.readdir(dir, function(err, list) {
    if (err){
      return callback(err);
    }
    
    list = list.filter(function (file) {
      return path.extname(file) === "." + extString;
    })

    callback(null, list);
  });
}