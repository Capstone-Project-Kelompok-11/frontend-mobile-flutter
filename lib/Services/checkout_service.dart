import 'package:dio/dio.dart';
import 'package:lms_apps/Models/unpaid_checkout_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class CheckOutService {
  Future<void> checkOut({required String courseId}) async {
    final token = await SharedPref.getToken();
    try {
      await Dio().post(
        '${APIConstant.url}/users/checkout?id=$courseId',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
    } on DioError catch (e) {
      throw Exception('Failed Post Data $e');
    }
  }

  Future<void> deleteCheckOut({required String courseId}) async {
    final token = await SharedPref.getToken();
    try {
      await Dio().delete(
        '${APIConstant.url}/users/checkout?id=$courseId',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
    } on DioError catch (e) {
      throw Exception('Failed Delete Data $e');
    }
  }

  Future<void> checkOutVerify(
      {required String checkOutId, required String paymentMethod}) async {
    final token = await SharedPref.getToken();
    try {
      await Dio().post(
        '${APIConstant.url}/users/checkout/verify?id=$checkOutId',
        data: {
          "payment_method": paymentMethod,
        },
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
    } on DioError catch (e) {
      throw Exception('Failed Post Data $e');
    }
  }

  Future<CheckOutResponse> checkOutUnpaid() async {
    final token = await SharedPref.getToken();
    try {
      final checkOutResponse = await Dio().get(
        '${APIConstant.url}/users/checkout/unpaid',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      print(checkOutResponse.data);
      return CheckOutResponse.fromJson(checkOutResponse.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }
}
