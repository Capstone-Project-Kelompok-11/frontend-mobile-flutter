import 'package:dio/dio.dart';
import 'package:lms_apps/Models/profile_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class ProfileService {
  Future<ProfileResponse> getUserInfo() async {
    final token = await SharedPref.getToken();

    Response response = await Dio().get(
      '${APIConstant.url}/users/info',
      options: Options(headers: APIConstant.auth('$token')),
    );
    return ProfileResponse.fromJson(response.data);
  }
}
