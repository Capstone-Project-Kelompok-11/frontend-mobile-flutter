import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class QuizAppbar extends StatelessWidget {
  const QuizAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Image.asset('assets/icon/ic_arrow_left.png'),
            ),
            Center(
              child: Text(
                'Quiz',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
