$(document).ready(function(){
  var userBankroll = 20;
  var userBankrupt = false;
  var guessMin = 1;
  var guessMax = 10;

  // Returns a random integer inclusive of max and min
  function getRandomNumber(min, max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  // Returns true or false, whether the input is valid
  function betInvalid(amount){
    var minBet = 5, maxBet = 10;
    return (amount < minBet || amount > maxBet) ? true : false;
  }

  // Returns a booleans, whether the user has less than specified amount
  function insufficientFunds(amount){
    return (amount > userBankroll) ? true : false;
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
  function checkGuess(guess, answer, betAmount){
    var difference = Math.abs(guess - answer);
    if (guess === answer) {
      alert("You are correct!");
      addToBankroll(betAmount);
    } else if (difference === 1){
      alert("You were so close!");
    } else {
      alert("Boo, you were wrong");
      subtractFromBankroll(betAmount);
    }
  }

  function addToBankroll(amount){
    userBankroll += amount;
  }

  function subtractFromBankroll(amount){
    userBankroll -= amount;
  }

  function bankrollEmpty(){
    return (userBankroll <= 0) ? true : false;
  }

  function displayBalance(){
    $('#user-bankroll').text(userBankroll);
  }

  function getInput(){
    var bet = $("#bet").val();
    var guess = $("#guess").val();
    return { bet: bet, guess: guess };
  }

  function runTurn(){
    var answer = getRandomNumber(guessMin, guessMax);
    var input = getInput();
    checkGuess(input.guess, answer, input.bet);
  }

  $("#place-bet").on("click", function(){
    runTurn();
    displayBalance();
  });

});



// do {
//  runTurn();
//  userBankrupt = bankrollEmpty();
// } while (!userBankrupt);