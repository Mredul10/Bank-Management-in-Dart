import 'dart:io';
import 'account.dart';

void main() {
  print('Enter the account holder name:');
  String name = stdin.readLineSync() ?? '';

  print('Enter the account number:');
  String accountNumber = stdin.readLineSync() ?? '';

  print('Enter the initial balance:');
  double initialBalance = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  Account account = Account(name, accountNumber, initialBalance);

  account.displayAccountDetails();

  while (true) {
    print('\nChoose an operation:');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Display Account Details');
    print('4. Exit');
    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        print('Enter the deposit amount:');
        double depositAmount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        account.deposite(depositAmount);
        break;

      case '2':
        print('Enter the withdrawal amount:');
        double withdrawAmount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        account.withdraw(withdrawAmount);
        break;

      case '3':
        account.displayAccountDetails();
        break;

      case '4':
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}