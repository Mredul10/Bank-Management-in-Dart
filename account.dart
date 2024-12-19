import 'bank.dart';

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