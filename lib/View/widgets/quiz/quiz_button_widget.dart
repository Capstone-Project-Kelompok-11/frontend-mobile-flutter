import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/final_screen.dart';

import '../../screens/theme/theme.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinalTaskScreen(),
                ));
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Submit Answer',
            style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: 14.4),
          ),
        ),
      ),
    );
  }
}
