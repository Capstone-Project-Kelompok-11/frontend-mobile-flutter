import 'package:dio/dio.dart';
import 'package:lms_apps/Models/quiz_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

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
}
