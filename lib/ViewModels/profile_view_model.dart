import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/profile_service.dart';

class ProfileViewModel with ChangeNotifier {
  var _nama;
  get nama => _nama;
  var _imagePath;
  get imagePath => _imagePath;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getUserInfo() async {
    _isLoading = true;
    await Future.delayed(const Duration(milliseconds: 1000));
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
      _isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      throw Exception('Error on $e');
    }
  }
}
