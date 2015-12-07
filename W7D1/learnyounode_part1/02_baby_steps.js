var sum = 0;
for (var i = 2, len = process.argv.length; i < len; i++){
   sum += Number(process.argv[i]);
}
console.log(sum);