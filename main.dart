import 'dart:io';


abstract class Bank {
  void deposite(double amount);
  void withdraw(double amount);
  void displayAccountDetails();
}


class Account implements Bank {
  String _accountHolderName;
  String _accountNumber;
  double _balance;

  Account(this._accountHolderName, this._accountNumber, this._balance);

  String get accountHolderName => _accountHolderName;
  String get accountNumber => _accountNumber;
  double get balance => _balance;

  @override
  void deposite(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Successfully deposited $amount. Current balance: $_balance');
    } else {
      print('Invalid deposit amount');
    }
  }

  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Successfully withdrew $amount. Remaining balance: $_balance');
    } else {
      print('Invalid withdrawal amount or insufficient balance');
    }
  }

  @override
  void displayAccountDetails() {
    print('\nAccount Details');
    print('Account Holder: $_accountHolderName');
    print('Account Number: $_accountNumber');
    print('Balance: $_balance');
  }
}

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