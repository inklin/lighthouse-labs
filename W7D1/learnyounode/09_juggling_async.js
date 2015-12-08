var http = require('http');
var urlCount = process.argv.length - 2;
var results = [];

function httpGet(index) {
  var result = "";
  http.get(process.argv[index + 2], function(res) {
    res.on('data', function(content) {
      result += content.toString();
    });
    res.on('end', function() {
      urlCount--;
      results[index] = result;
      if (urlCount === 0) {
        printResult();
      }
    });
  })
}

function printResult() {
  results.forEach(function(result) {
    console.log(result);
  })
}

for (var i = 0; i < urlCount; i++) {
  httpGet(i);
}

// Official Solution
// var http = require('http')
// var bl = require('bl')
// var results = []
// var count = 0

// function printResults () {
//   for (var i = 0; i < 3; i++)
//     console.log(results[i])
// }

// function httpGet (index) {
//   http.get(process.argv[2 + index], function (response) {
//     response.pipe(bl(function (err, data) {
//       if (err)
//         return console.error(err)

//       results[index] = data.toString()
//       count++

//       if (count == 3) // yay! we are the last one!
//         printResults()
//     }))
//   })
// }

// for (var i = 0; i < 3; i++)
//   httpGet(i)