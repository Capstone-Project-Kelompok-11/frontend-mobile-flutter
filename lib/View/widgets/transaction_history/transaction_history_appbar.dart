import 'package:flutter/material.dart';

class TransactionHistoryAppBar extends StatelessWidget {
  const TransactionHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icon/ic_arrow_left.png',
                    width: 20,
                    height: 20,
                  )),
              const Center(
                child: Text(
                  'Transaction History',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
