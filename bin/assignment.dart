import 'dart:io';

import 'package:dart_application/assignment_func.dart';

void main() {
  print("Welcome to First City Monument Bank");

  // int check_balance = 1;
  // int deposit = 2;
  // int withdraw = 3;

  print(
    "Please select one of the following of the following options \n 1 - Check-Balance \n 2 - Deposit \n 3 - withdraw ",
  );

  int option = int.parse(stdin.readLineSync()!);

  if (option == 1) {
    print("Your current balance is: ");
    print(account_balance());
  } else if (option == 2) {
    print("Enter the amount you intend to deposit :");

    int amount = int.parse(stdin.readLineSync()!);

    print("$amount succesfully deposited. Your current balance is:");

    // print(deposit(amount: amount, balance: account_balance()));

    int result = mine(amount: amount, balance: account_balance());

    print('New balance: $result');
  } else if (option == 3) {
    print("Input your withdrawl amount :");

    int withdraw_amount = int.parse(stdin.readLineSync()!);

    int withdrawn = withdraw(
      amount: withdraw_amount,
      balance: account_balance(),
    );

    print('You have succefully withdrawed ; $withdrawn');
  }
}
