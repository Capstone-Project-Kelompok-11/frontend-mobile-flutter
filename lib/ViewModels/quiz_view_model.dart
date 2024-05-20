import 'package:flutter/material.dart';
import 'package:lms_apps/Models/quiz_response.dart';
import 'package:lms_apps/Services/get_quiz_service.dart';

import '../Models/my_course_response.dart';

class QuizViewModel with ChangeNotifier {
  List<Quiz> _quizes = [];
  List<Quiz> get quizes => _quizes;
  List<Quiz> _answerquiz = [];
  List<Quiz> get answerquiz => _answerquiz;
  bool get areLoading => _areLoading;
  bool _areLoading = false;

  void selectAnswer(Choice? choices) {
    choices?.valid = !(choices.valid ?? false);
    notifyListeners();
  }

  void getQuizes(String modulId) async {
    _areLoading = true;
    // await Future.delayed(const Duration(milliseconds: 1000));
    final quizResponse = await QuizService().getQuiz(modulId);
    _quizes.clear();
    _answerquiz.clear();
    _quizes = quizResponse.data ?? [];
    _answerquiz = quizResponse.data ?? [];
    notifyListeners();
    print(_quizes);
    _areLoading = false;
    notifyListeners();
  }
  // Futures<Quiz>
}
