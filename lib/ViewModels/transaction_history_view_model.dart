import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms_apps/Models/transaction_history_response.dart';
import 'package:lms_apps/Services/transaction_history_service.dart';

class TransactionHistoryViewModel with ChangeNotifier {
  List<Datum> _transactionHistory = [];
  List<Datum> get transactionHistory => _transactionHistory;

  getTransaction() async {
    final result = await TransactionHistoryService().getUserCourse();
    if (result.data!.isNotEmpty) {
      _transactionHistory = result.data!;
    } else {
      _transactionHistory = [];
    }
    notifyListeners();
  }

  currencyFormat({required dynamic number, required int decimalDigit}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
