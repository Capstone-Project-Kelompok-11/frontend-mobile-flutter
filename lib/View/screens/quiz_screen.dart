import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_appbarr.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_body.dart';
import 'package:lms_apps/View/widgets/quiz/quiz_button_widget.dart';

class QuizScreen extends StatelessWidget {
  final String moduleId;
  const QuizScreen({
    super.key, 
    required this.moduleId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuizAppbar(),
            const SizedBox(
              height: 29,
            ),
            QuizBody(
              moduleId: moduleId,
            ),
          ],
        ),
      ),
      floatingActionButton: QuizButton(
        moduleId: moduleId,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
