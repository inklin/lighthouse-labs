var userMoney = 100;

function getBet(){
  var bet = null;
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

getBet();