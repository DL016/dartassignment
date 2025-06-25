import 'package:dart_application/bankingsyst_func.dart';
import 'dart:io';

void main() {
  int? choice;

  do {
    displayMenu();
    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();
    choice = int.tryParse(input ?? '');

    print('');

    switch (choice) {
      case 1:
        createAccount();
        break;
      case 2:
        login();
        break;
      case 3:
        print('Exiting banking system. Goodbye!');
        break;
      default:
        print('Invalid choice. Please try again.');
        break;
    }
    print('');
  } while (choice != 3);
}
