import 'dart:io';

import 'package:dart_application/task1.dart';

void main() {
  print("Welcome to mortage bank");

  // int check_balance = 1;
  // int deposit = 2;
  // int withdraw = 3;

  print("Please select any of the following of the following \n 1 - Check-Balance \n 2 - Deposit \n 3 - withdraw ");

  int option = int.parse(stdin.readLineSync()!)
  
  ;



  if (option == 1) {

    print("Your account balance is :");
    print(account_balance());
  } 
  
  else if (option == 2) {
    print("How much do you intend to deposit :");

    int amount = int.parse(stdin.readLineSync()!);

    print("$amount succesfully deposited new balance is:");

      // print(deposit(amount: amount, balance: account_balance()));

      int result = mine(
    amount: amount,
    balance: account_balance(),
  );

  print( 'New balance: $result'); 
  


  } else if (option == 3) {
      print("How much do you intend to withdraw :");

    int withdraw_amount = int.parse(stdin.readLineSync()!);

    int withdrawed = withdraw(amount: withdraw_amount, balance: account_balance());

    print('u have succefully withdrawed ; $withdrawed');
  }


}