import 'package:dio/dio.dart';
import 'package:lms_apps/Models/review_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class ReviewService {
  Future<ReviewResponse> getReviews(
      {int? page, int? size, String? courseId}) async {
    final token = await SharedPref.getToken();
    final response = await Dio().get(
      '${APIConstant.url}/public/course/reviews?page=1&size=10&id=$courseId',
      options: Options(
        headers: APIConstant.auth('$token'),
      ),
      
    );
    return ReviewResponse.fromJson(response.data);
  }
}
