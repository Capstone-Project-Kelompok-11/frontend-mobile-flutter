import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_appbarr.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_body.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_button_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizAppbar(),
            SizedBox(
              height: 29,
            ),
            QuizBody(),
          ],
        ),
      ),
      floatingActionButton: QuizButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
