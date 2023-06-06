import 'package:dio/dio.dart';
import 'package:lms_apps/Models/user_info_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class EditProfileService {
  Future<UsersInformationResponse> getUserInfo() async {
    final token = await SharedPref.getToken();
    // print(token);

    final response = await Dio().get(
      '${APIConstant.url}/users/info',
      options: Options(headers: APIConstant.auth('$token')),
    );
    // print(response.data);

    // return jsonResponse;
    return UsersInformationResponse.fromJson(response.data);
  }

  Future<UsersInformationResponse> changeUserInfo({
    required String name,
    required String phone,
    required String password,
  }) async {
    final token = await SharedPref.getToken();

    try {
      final response = await Dio().post(
        data: {
          "gender": "M",
          "dob": '2006-01-02T15:04:05Z',
          "address": "string",
          "country_code": "1234",
          "city": "string",
          "postal_code": "string",
          "name": name,
          "phone": phone,
          "confirm_password": password,
        },
        '${APIConstant.url}/users/info',
        options: Options(headers: APIConstant.auth('$token')),
      );
      print(response.data['message']);
      return UsersInformationResponse.fromJson(response.data);
    } on DioError catch (e) {
      print('Error ${e.response?.data['message']}');
    }
    return UsersInformationResponse();
  }
}
