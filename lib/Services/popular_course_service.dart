import 'package:dio/dio.dart';
import 'package:lms_apps/Models/popular_course_response.dart';
import 'package:lms_apps/Services/constant.dart';

class PopularCourseService {
  Future<PopularCourseResponse> getPopularCourse() async {
    try {
      final response = await Dio()
          .get('${APIConstant.url}/public/course/populars?page=1&size=10');
      print(response.data);
      return PopularCourseResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response!.data);
      throw Exception('Failed Get Data $e');
    }
  }
}
