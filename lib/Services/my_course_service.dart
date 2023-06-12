import 'package:dio/dio.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class MyCourseOnProgressService {
  Future<MyCourseResponse> getMyCourse() async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/checkout/paid',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    return MyCourseResponse.fromJson(response.data);
  }

  Future<DetailCourseResponse> getMyCourseByID(String courseID) async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/course?id=$courseID',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    return DetailCourseResponse.fromJson(response.data);
  }
}

class MyCourseCompleteService {
  Future<DetailCourseResponseData> getMyCourseComplete(String courseID) async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/course?id=$courseID',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
    );
    return DetailCourseResponseData.fromJson(response.data);
  }
}
