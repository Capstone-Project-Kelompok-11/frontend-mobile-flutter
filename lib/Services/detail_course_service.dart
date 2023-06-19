import 'package:dio/dio.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class DetailLessonService {
  Future<DetailCourseResponse> getLessonCourse(String courseId) async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/course?id=$courseId',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    print(response.data);
    return DetailCourseResponse.fromJson(response.data);
  }
}
