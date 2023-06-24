import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Models/quiz_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

import '../Models/quisesanswer_request_response.dart';

class QuizService {
  Future<QuizResponse> getQuiz(String moduleId) async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/quiz?id=$moduleId',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    return QuizResponse.fromJson(response.data);
  }

  Future<void> postQuiz(String moduleId, QuizResponse quizanswer) async {
    try {
      final token = await SharedPref.getToken();

      final response = await Dio().post(
        '${APIConstant.url}/users/quiz?id=$moduleId',
        data: quizResponseToJson(quizanswer),
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      debugPrint(response.data.toString());
      print(quizResponseToJson(quizanswer));
    } on DioError catch (e) {
      // print(quizResponseToJson(quizanswer));
      // print(e.response?.data);
    }

    // print(response.data);
  }
}
