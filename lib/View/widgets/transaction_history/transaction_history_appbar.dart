import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class TransactionHistoryAppBar extends StatefulWidget {
  const TransactionHistoryAppBar({super.key});

  @override
  State<TransactionHistoryAppBar> createState() =>
      _TransactionHistoryAppBarState();
}

class _TransactionHistoryAppBarState extends State<TransactionHistoryAppBar> {
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
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  icon: Image.asset(
                    'assets/icon/ic_arrow_left.png',
                    width: 20,
                    height: 20,
                  )),
              Center(
                child: Text(
                  'Chat',
                  style: blackTextStyle.copyWith(
                      fontSize: 25, fontWeight: semiBold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
