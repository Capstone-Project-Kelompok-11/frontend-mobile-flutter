import 'package:dio/dio.dart';
import 'package:lms_apps/Models/transaction_history_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class TransactionHistoryService {
  Future<TransactionHistoryResponse> getUserCourse() async {
    final token = await SharedPref.getToken();

    final response = await Dio().get(
      '${APIConstant.url}/users/checkout/paid',
      options: Options(headers: APIConstant.auth('$token')),
    );
    return TransactionHistoryResponse.fromJson(response.data);
  }
}
