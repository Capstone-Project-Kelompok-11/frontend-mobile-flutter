import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/transaction_history/transaction_history_appbar.dart';
import 'package:lms_apps/View/widgets/transaction_history/transaction_history_body.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionHistoryAppBar(),
            TransactionHistoryBody(),
          ],
        ),
      ),
    );
  }
}
