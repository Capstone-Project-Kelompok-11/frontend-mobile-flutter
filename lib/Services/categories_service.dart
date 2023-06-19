import 'package:dio/dio.dart';
import 'package:lms_apps/Models/categories_response.dart';
import 'package:lms_apps/Services/constant.dart';

class CategoriesService{
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await Dio()
          .get('${APIConstant.url}/public/categories');
      print(response.data);
      return CategoriesResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }
}