import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/profile_service.dart';

class ProfileViewModel with ChangeNotifier {
  var _nama;
  get nama => _nama;
  var _imagePath;
  get imagePath => _imagePath;

  getUserInfo() async {
    try {
      final result = await ProfileService().getUserInfo();
      if (result.data != null) {
        _nama = result.data?.name;
        if (result.data?.image != '') {
          _imagePath = "${result.data?.image}";
        } else {
          _imagePath = '';
        }
      }
      notifyListeners();
    } on DioError catch (e) {
      throw Exception('Error on $e');
    }
  }
}
