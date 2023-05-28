import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/Rectangle 26.png'),
                ),
              ),
              const SizedBox(
                height: 17,
              )
            ],
          )
        ],
      ),
    );
  }
}
