import 'package:dio/dio.dart';
import 'package:lms_apps/Models/public_course_response.dart';

import 'constant.dart';

class PublicCourseService {
  Future<PublicCourseResponse> getPublicCourse(
      {String? search, String? category}) async {
    try {
      final response = await Dio().get(
          '${APIConstant.url}/public/courses?page=1&size=10&search=$search&category=$category');
      print(response.data);
      return PublicCourseResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }
}
