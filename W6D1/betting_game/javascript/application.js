var userMoney = 100;
var guessMin = 1;
var guessMax = 10;
var answer = null;

function init(){
  answer = getRandomNumber(guessMin, guessMax);
}

// Returns a random integer inclusive of max and min
function getRandomNumber(min, max){
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Returns an integer, the bet input from the user
function getBet(){
  var bet = null;
  do {
    bet = prompt("Place a bet between $5 and $10");
  } while (betInvalid(bet));
  return bet;
}

// Returns true or false, whether the input is valid
function betInvalid(amount){
  var minBet = 5;
  var maxBet = 10;
  return (amount < minBet || amount > maxBet) ? true : false;
}

// Returns an integer, the guess input from the user
function getGuess(){
  var guess = null;
  do {
    guess = prompt("Guess a number between 1-10");
  } while (guessInvalid(guess));
  return guess;
}

// Returns true or false, whether the guess input is valid
function guessInvalid(guess){
  return (guess < guessMin || guess > guessMax) ? true : false;
}

// Returns a boolean, checks the guess against the answer
function checkGuess(guess){
  var difference = Math.abs(guess - answer);
  if (guess === answer) {
    alert("You are correct!");
  } else if (difference === 1){
    alert("You were so close!");
  } else {
    alert("Boo, you were wrong");
  }
}

function runGame(){
  var bet = getBet();
  var guess = getGuess();
  console.log("Answer is ", answer);
  console.log("Bet is " , bet);
  console.log("Guess is ", guess);
  checkGuess(guess);
}

init();
runGame();