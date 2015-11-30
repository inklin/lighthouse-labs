var userMoney = 100;
var guessMin = 1;
var guessMax = 10;
var number = null;
var bet = null;

function init(){
  number = getRandomNumber(guessMin, guessMax);
}

// Returns a random integer inclusive of max and min
function getRandomNumber(min, max){
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getBet(){
  do {
    bet = prompt("Place a bet between $5 and $10");
  } while (betInvalid(bet));
  return bet;
}

function betInvalid(amount){
  var minBet = 5;
  var maxBet = 10;
  return (amount < minBet || amount > maxBet) ? true : false;
}

init();
getBet();