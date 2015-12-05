$(document).ready(function(){
  var userBankroll = 100;
  var userBankrupt = false;
  var guessMin = 1;
  var guessMax = 10;
  var answer = null;

  var cardNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  for (var i = 0, len = cardNumbers.length; i < len; i++){
    var cardNumber = cardNumbers[i];
    $("#card" + cardNumber).addClass("card-" + cardNumber).addClass("guess-card");
  }

  function createAnswerCard(newAnswer){
    var answerCard = $("#answer-card");
    answerCard.removeClass("card-" + answer);
    $("#answer-card").addClass("card-" + newAnswer);
    answer = newAnswer;
  }

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

  // Returns true or false, whether the guess input is valid
  function guessInvalid(guess){
    return (guess < guessMin || guess > guessMax) ? true : false;
  }

  // Returns a boolean, checks the guess against the answer
  function checkGuess(guess, betAmount){
    var difference = Math.abs(guess - answer);
    if (guess === answer) {
      $("#instruction").text("You are correct!");
      addToBankroll(betAmount);
      displayBalance();
    } else if (difference === 1){
      $("#instruction").text("You were off by 1. You get to keep your money.");
    } else {
      $("#instruction").text("Boo, you were wrong");
      subtractFromBankroll(betAmount);
      displayBalance();
    }
  }

  function addToBankroll(amount){
    userBankroll += (amount * 2);
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
    var bet = parseInt($("#bet").val());
    return { bet: bet, guess: guess };
  }

  function placeBet(){
    var input = getInput();
    checkGuess(input.guess, input.bet);
    showAnswer();
    setTimeout(function(){
      setupBet();
    }, 1500);
  }

  function showAnswer(){
    $(".flip-container").addClass("flipped");
  }

  function setupBet(){
    $(".card.is-chosen").removeClass("is-chosen");
    $(".flip-container").removeClass("flipped");
    $("#instruction").text("Pick a card!");
    guess = null;
    var newAnswer = getRandomNumber(guessMin, guessMax);
    createAnswerCard(newAnswer);
  }

  setupBet();

  $("#place-bet").on("click", function(){
    placeBet();
  });

  $(".guess-card").on("click", function(){
    $(this).addClass("is-chosen");
    var guessString = $(this).attr("id").replace("card", '');
    guess = parseInt(guessString);
    $("#instruction").text("Place a bet amount.")
  });

});



// do {
//  runTurn();
//  userBankrupt = bankrollEmpty();
// } while (!userBankrupt);