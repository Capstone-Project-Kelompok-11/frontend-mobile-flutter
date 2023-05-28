import 'package:flutter/material.dart';

import '../../screens/theme/theme.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Take Quiz',
                style: whiteTextStyle.copyWith(
                    fontWeight: regular, fontSize: 14.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
