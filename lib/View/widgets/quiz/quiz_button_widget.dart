import 'package:flutter/material.dart';
import 'package:lms_apps/Services/get_quiz_service.dart';
import 'package:lms_apps/View/screens/final_screen.dart';
import 'package:provider/provider.dart';

import '../../../ViewModels/quiz_view_model.dart';
import '../../screens/theme/theme.dart';

class QuizButton extends StatelessWidget {
  final String modulId;
  const QuizButton({super.key, required this.modulId});

  @override
  Widget build(BuildContext context) {
    final quizViewModel = Provider.of<QuizViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            QuizService().postQuiz(modulId, quizViewModel.quizes);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const FinalTaskScreen(),
            //     ));
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
