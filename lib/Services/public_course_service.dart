import 'package:dio/dio.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Models/public_course_response.dart';
import 'package:lms_apps/utils/shared_pref.dart';

import 'constant.dart';

class PublicCourseService {
  Future<PublicCourseResponse> getPublicCourse(
      {int? page, String? search, String? category, int? size}) async {
    try {
      final response = await Dio().get(
          '${APIConstant.url}/public/courses?page=$page&size=$size&search=$search&category=$category');
      // print(response.data);
      return PublicCourseResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }

  Future<DetailCourseResponse> getCourseById({String? courseId}) async {
    try {
      final token = await SharedPref.getToken();
      final response = await Dio().get(
        '${APIConstant.url}/users/course?id=$courseId',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      return DetailCourseResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }
}
