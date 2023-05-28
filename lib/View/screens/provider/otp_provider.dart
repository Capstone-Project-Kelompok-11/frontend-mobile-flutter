import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screen/dashboard_screen.dart';
// import 'package:flutter_application_2/screen/register_with_provider_page.dart';
// import 'package:flutter_application_2/utils/shared_pref.dart';

class OTPProvider with ChangeNotifier {
  // Password Property
  String _password = "";
  String get password => _password;

  bool _isPasswordValid = true;
  bool get isPasswordValid => _isPasswordValid;

  String _errorPasswordMessage = "";
  String get errorPasswordMessage => _errorPasswordMessage;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isButtonPasswordValid = false;
  bool get isButtonPasswordValid => _isButtonPasswordValid;

  void validatePassword(String value) {
    _password = value;
    if (_password.isEmpty) {
      _errorPasswordMessage = "Code OTP Tidak Boleh Kosong";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (_password.length < 4) {
      _errorPasswordMessage = "Code OTP harus lebih dari 4";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else {
      _isButtonPasswordValid = true;
      _isPasswordValid = true;
    }
    print(_isButtonPasswordValid);
    notifyListeners();
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;

    notifyListeners();
  }
}
