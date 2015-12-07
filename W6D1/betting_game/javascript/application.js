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

  // Returns a boolean, checks the guess against the answer
  function checkGuess(guess, betAmount) {
    var difference = Math.abs(guess - answer);
    if (guess === answer) {
      $("#instruction").text("Winner! You just won " + betAmount * 7 + " dollars!");
      addToBankroll(betAmount);
      displayBalance();
    } else if (difference === 1){
      $("#instruction").text("You were off by 1. You get to keep your money.");
    } else {
      $("#instruction").text("Better luck next round.");
      subtractFromBankroll(betAmount);
      displayBalance();
    }
  }

  function addToBankroll(amount) {
    userBankroll += (amount * 7);
  }

  function subtractFromBankroll(amount) {
    userBankroll -= amount;
  }

  function bankrollEmpty() {
    return (userBankroll <= 0) ? true : false;
  }

  function displayBalance() {
    $("#bankroll").text(userBankroll);
  }

  function showAnswer() {
    $(".flip-container").addClass("flipped");
  }

  // Returns a booleans, whether the user has less than specified amount
  function sufficientFunds(bet) {
    return (bet <= userBankroll) ? true : false;
  }

  function betValid(bet) {
    return (bet > 0) ? true : false;
  }

  function guessValid(guess) {
    return (guess !== null && guess <= guessMax && guess >= guessMin);
  }

  function setupBet() {
    $("#instruction").text("Pick a card!");
    guess = null;
    var newAnswer = getRandomNumber(guessMin, guessMax);
    createAnswerCard(newAnswer);
  }

  function getInput() {
    var bet = parseInt($("#bet").val());
    return { bet: bet, guess: guess };
  }

  function validateInputs(input) {
    var errors = [];

    if (betValid(input.bet) && sufficientFunds(input.bet) && guessValid(input.guess)) {
      return true;
    }

    if (!betValid(input.bet)) {
      errors.push("Bets must be greater than 0.");
    } else if (!sufficientFunds(input.bet)) {
      errors.push("You have insufficient funds to place that bet.");
    }

    if (!guessValid(input.guess)) {
      errors.push("You have not guessed a number.");
    }

    if (errors.length > 0) {
      $("#instruction").text(errors.join(" "));
    }

    return false;
  }

  function placeBet(input) {
    checkGuess(input.guess, input.bet);
    showAnswer();
    setTimeout(function() {
      hideCard();
    }, 1500);
    setTimeout(function(){
      if (userBankroll > 0) {
        setupBet();
      } else {
        $("#instruction").text("You're out of money!");
        $("#add-money").show();
      }
    }, 2000);
  }

  function hideCard() {
    $(".card.is-chosen").removeClass("is-chosen");
    $(".flip-container").removeClass("flipped");
  }

  $("#place-bet").on("click", function(){
    var input = getInput();
    var inputValid = validateInputs(input);

    if (inputValid){
      placeBet(input);
    }
  });

  $(".guess-card").on("click", function() {
    $(".is-chosen").removeClass("is-chosen");
    $(this).addClass("is-chosen");
    var guessString = $(this).attr("id").replace("card", '');
    guess = parseInt(guessString);
    $("#instruction").text("Place your bet.")
  });

  $("#add-money").on("click", function() {
    userBankroll = 100;
    $("#bankroll").text(100);
    $(this).hide();
    $("#instruction").text("Thanks for adding $100. Pick a card!");
  });

  setupBet();

});