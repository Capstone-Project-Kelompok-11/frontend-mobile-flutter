import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lms_apps/Models/banner_response.dart';
import 'package:lms_apps/Services/constant.dart';

class CarouselService {
  Future<BannerResponse> getBanner() async {
    try {
      final response =
          await Dio().get('${APIConstant.url}/public/banners?size=10&page=1');

      return BannerResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Data $e');
    }
  }
}
