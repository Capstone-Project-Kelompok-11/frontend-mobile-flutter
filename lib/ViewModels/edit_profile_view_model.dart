import 'package:flutter/material.dart';
import 'package:lms_apps/Models/user_info_response.dart';
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

  getNewChangeUserInfo() async {
    try {
      final result = await EditProfileService().changeUserInfo(
        name: nameController.text,
        phone: phoneController.text,
        password: confirmPassword.text,
      );
      notifyListeners();
      if (result.data != null) {
        EditProfileService().changeUserInfo(
            name: nameController.text,
            phone: phoneController.text,
            password: confirmPassword.text);
      }
    } catch (e) {}
  }

  getUserInfo() async {
    try {
      final result = await EditProfileService().getUserInfo();
      if (result.data != null) {
        _name = result.data!.name;
        _phone = result.data!.phone;
        _password = result.data!.confirmPassword;
        _email = result.data!.email;
      }
    } catch (e) {}
  }
}
