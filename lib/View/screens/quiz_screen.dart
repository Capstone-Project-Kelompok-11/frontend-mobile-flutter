import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_appbarr.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_body.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_button_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.modulid});
  final String modulid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizAppbar(),
            SizedBox(
              height: 29,
            ),
            QuizBody(
              modulId: '1b26949893aa466daf79409b7bd80c82',
            ),
          ],
        ),
      ),
      floatingActionButton: QuizButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
