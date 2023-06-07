import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/Services/edit_profile_service.dart';

class EditProfileViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  var _name;
  get name => _name;
  var _phone;
  get phone => _phone;
  var _password;
  get password => _password;
  var _email;
  get email => _email;
  var _imagePath;
  get imagePath => _imagePath;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  getNewChangeUserInfo() async {
    try {
      final result = await EditProfileService().changeUserInfo(
        name: nameController.text,
        phone: phoneController.text,
        password: confirmPassword.text,
      );
      if (result.data != null) {
        nameController.text = '';
        phoneController.text = '';
        confirmPassword.text = '';
        notifyListeners();
      }
    } on DioError catch (e) {
      throw Exception('Error on $e');
    }
  }

  getUserInfo() async {
    try {
      final result = await EditProfileService().getUserInfo();
      if (result.data != null) {
        _name = result.data!.name;
        _phone = result.data!.phone;
        _password = result.data!.confirmPassword;
        _email = result.data!.email;
        if (result.data?.image != '') {
          _imagePath = "${APIConstant.url}/public/image/${result.data!.image}";
        } else {
          _imagePath = '';
        }

        nameController.text = '';
        phoneController.text = '';
        confirmPassword.text = '';

        notifyListeners();
      }
    } on DioError catch (e) {
      throw Exception('Error on $e');
    }
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }
}
