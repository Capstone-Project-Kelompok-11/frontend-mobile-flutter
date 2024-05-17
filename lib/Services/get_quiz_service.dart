import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Models/quiz_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

import '../Models/quisesanswer_request_response.dart';

class QuizService {
  Future<QuizResponse> getQuiz(String moduleId) async {
    final token = await SharedPref.getToken();
    print(' halo , ${APIConstant.url}/users/quiz?id=${moduleId}');
    final response = await Dio().get(
      '${APIConstant.url}/users/quiz?id=${moduleId}',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    return QuizResponse.fromJson(response.data);
  }

  Future<void> postQuiz(String moduleId, List<Quiz> quizanswer) async {
    try {
      var jsonData = jsonEncode(
          {'quizzes': quizanswer.map((quiz) => quiz.toJson()).toList()});
      // var jsonString = jsonEncode(quizanswer.toJson());
      final token = await SharedPref.getToken();

      final response = await Dio().post(
        '${APIConstant.url}/users/quiz?id=${moduleId}',
        // data: quizResponseToJson(quizanswer),
        data: jsonData,
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      // debugPrint(response.data.toString());
      print(response.data['message']);
    } on DioError catch (e) {
      throw Exception('Failed Post Data $e');
    }

    // print(quizResponseToJson(quizanswer));
    // print(e.response?.statusMessage);
  }

  // print(response.data);
}
