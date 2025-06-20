int account_balance({int balance = 10000}) {
  return balance;
}

// int deposit(balance, amount){
//   int deposited_amount = balance + amount;
//   return deposited_amount;
// }

int mine({required int amount, required int balance}) {
  int deposited_amount = balance + amount;

  return deposited_amount;
}

int withdraw({required int amount, required int balance}) {
  int withdrawed = balance - amount;

  return withdrawed;
}
