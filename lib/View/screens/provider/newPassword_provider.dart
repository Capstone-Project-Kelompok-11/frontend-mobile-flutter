// ignore_for_file: prefer_final_fields, camel_case_types, avoid_print

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// import 'package:lms_apps/View/screens/login_screen.dart';

class newPasswordProvider with ChangeNotifier {
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
      _errorPasswordMessage = "Password Tidak Boleh Kosong";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (_password[0] != _password[0].toUpperCase()) {
      _errorPasswordMessage = "Password harus di awali huruf Besar";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (_password.length < 4) {
      _errorPasswordMessage = "Password harus lebih dari 4";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_password)) {
      _errorPasswordMessage = "Password minimal memiliki angka";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else {
      _isButtonPasswordValid = true;
      _isPasswordValid = true;
      _isConfirmPasswordValid = true;
    }
    print(_isButtonPasswordValid);
    notifyListeners();
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;

    notifyListeners();
  }
  // End Password Property

  // Confirm Password Property
  String _confirmPassword = "";
  String get confirmPassword => _confirmPassword;

  bool _isConfirmPasswordValid = true;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid;

  String _errorConfirmPasswordMessage = "";
  String get errorConfirmPasswordMessage => _errorConfirmPasswordMessage;

  bool _isHideConfirmPassword = true;
  bool get isHideConfirmPassword => _isHideConfirmPassword;

  bool _isButtonConfirmPasswordValid = false;
  bool get isButtonConfirmPasswordValid => _isButtonConfirmPasswordValid;

  void validateConfirmPassword(String value) {
    _confirmPassword = value;
    if (_confirmPassword != _password) {
      _errorConfirmPasswordMessage = "Password tidak cocok";
      _isConfirmPasswordValid = false;
      _isButtonConfirmPasswordValid = false;
    } else {
      _isPasswordValid = true;
      _isConfirmPasswordValid = true;
      _isButtonConfirmPasswordValid = true;
      _isButtonPasswordValid = true;
    }
    print(_isButtonConfirmPasswordValid);

    notifyListeners();
  }

  void showHideConfirmPassword() {
    _isHideConfirmPassword = !_isHideConfirmPassword;
    notifyListeners();
  }

  // End Confirm Password
  bool disableButtonNewPassowrd() {
    bool isDisableButton =
        isButtonPasswordValid && isButtonConfirmPasswordValid;

    return isDisableButton;
  }
}
