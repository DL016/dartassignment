import 'dart:io';

class UserAccount {
  String fullName;
  String pin;
  double balance;

  UserAccount(this.fullName, this.pin, this.balance);

  void displayAccountInfo() {
    print('Account Holder: $fullName');
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
  }
}

Map<String, UserAccount> accounts = {};
int nextAccountNumber = 1001;

void displayMenu() {
  print('===== Simple Banking System =====');
  print('1. Create New Account');
  print('2. Login to Account');
  print('3. Exit');
  print('=================================');
}

void createAccount() {
  String fullName;
  String pin1, pin2;
  double? initialDeposit;

  print('--- Create New Account ---');
  stdout.write('Enter your full name: ');
  fullName = stdin.readLineSync() ?? '';

  do {
    stdout.write('Create a 4-digit PIN: ');
    pin1 = stdin.readLineSync() ?? '';
    stdout.write('Confirm your 4-digit PIN: ');
    pin2 = stdin.readLineSync() ?? '';

    if (pin1 != pin2) {
      print('PINs do not match. Please try again.');
    } else if (pin1.length != 4 || int.tryParse(pin1) == null) {
      print('PIN must be a 4-digit number. Please try again.');
    }
  } while (pin1 != pin2 || pin1.length != 4 || int.tryParse(pin1) == null);

  do {
    stdout.write('Enter initial deposit amount (minimum \$50.00): \$');
    String? depositInput = stdin.readLineSync();
    initialDeposit = double.tryParse(depositInput ?? '');

    if (initialDeposit == null || initialDeposit < 50.00) {
      print('Invalid amount. Minimum initial deposit is \$50.00.');
    }
  } while (initialDeposit == null || initialDeposit < 50.00);

  String newAccountNumber = nextAccountNumber.toString();
  accounts[newAccountNumber] = UserAccount(fullName, pin1, initialDeposit);
  nextAccountNumber++;

  print('Account created successfully!');
  print('Your Account Number is: $newAccountNumber');
}

void login() {
  print('--- Login to Account ---');
  stdout.write('Enter Account Number: ');
  String? accountNumber = stdin.readLineSync();

  stdout.write('Enter PIN: ');
  String? pin = stdin.readLineSync();

  if (accountNumber != null && accounts.containsKey(accountNumber)) {
    UserAccount user = accounts[accountNumber]!;
    if (user.pin == pin) {
      print('\nLogin successful! Welcome, ${user.fullName}.');
      loggedInMenu(user, accountNumber); // Pass account number as well
    } else {
      print('Incorrect PIN. Login failed.');
    }
  } else {
    print('Account not found.');
  }
}

void loggedInMenu(UserAccount user, String accountNumber) {
  int? choice;

  do {
    print('\n--- Account Operations (${user.fullName}) ---');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Logout');
    print('-----------------------------------------');
    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();
    choice = int.tryParse(input ?? '');

    print('');

    switch (choice) {
      case 1:
        deposit(user);
        break;
      case 2:
        withdraw(user);
        break;
      case 3:
        checkBalance(user);
        break;
      case 4:
        print('Logging out. Goodbye, ${user.fullName}!');
        break;
      default:
        print('Invalid choice. Please try again.');
        break;
    }
  } while (choice != 4);
}

void deposit(UserAccount user) {
  print('--- Deposit ---');
  stdout.write('Enter amount to deposit: \$');
  String? amountInput = stdin.readLineSync();
  double? amount = double.tryParse(amountInput ?? '');

  if (amount == null || amount <= 0) {
    print('Invalid amount. Please enter a positive number.');
  } else {
    user.balance += amount;
    print(
      'Deposit successful. New balance: \$${user.balance.toStringAsFixed(2)}',
    );
  }
}

void withdraw(UserAccount user) {
  print('--- Withdraw ---');
  stdout.write('Enter amount to withdraw: \$');
  String? amountInput = stdin.readLineSync();
  double? amount = double.tryParse(amountInput ?? '');

  if (amount == null || amount <= 0) {
    print('Invalid amount. Please enter a positive number.');
  } else if (amount > user.balance) {
    print('Insufficient funds.');
  } else {
    user.balance -= amount;
    print(
      'Withdrawal successful. New balance: \$${user.balance.toStringAsFixed(2)}',
    );
  }
}

void checkBalance(UserAccount user) {
  print('\n--- Account Balance ---');
  user.displayAccountInfo();
}
