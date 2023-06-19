import 'package:flutter/material.dart';
import 'package:lms_apps/Models/quiz_response.dart';
import 'package:lms_apps/Services/get_quiz_service.dart';

import '../Models/my_course_response.dart';

class QuizViewModel with ChangeNotifier {
  List<Quiz> _quizes = [];
  List<Quiz> get quizes => _quizes;
  void getQuizes(String modulId) async {
    final quizResponse = await QuizService().getQuiz(modulId);
    _quizes = quizResponse.data ?? [];
    print(_quizes);
  }
}
