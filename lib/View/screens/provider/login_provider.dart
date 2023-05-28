import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/register_screen.dart';
// import 'package:flutter_application_2/screen/dashboard_screen.dart';
// import 'package:flutter_application_2/screen/register_with_provider_page.dart';
// import 'package:flutter_application_2/utils/shared_pref.dart';

class LoginProvider with ChangeNotifier {
  // fullname Property
  String _fullname = "";
  String get fullname => _fullname;

  bool _isfullnameValid = true;
  bool get isfullnameValid => _isfullnameValid;

  String _errorfullnameMessage = "";
  String get errorfullnameMessage => _errorfullnameMessage;

  // Password Property
  String _password = "";
  String get password => _password;

  bool _isPasswordValid = true;
  bool get isPasswordValid => _isPasswordValid;

  String _errorPasswordMessage = "";
  String get errorPasswordMessage => _errorPasswordMessage;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  // Button Prorerty
  bool _isButtonfullnameDisable = false;
  bool get isButtonfullnameDisable => _isButtonfullnameDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;

  void validatefullname(String value) {
    _fullname = value;
    if (_fullname.isEmpty) {
      _isfullnameValid = false;
      _isButtonfullnameDisable = false;

      _errorfullnameMessage = "fullname Tidak Boleh Kosong!";
    } else if (_fullname.length < 4) {
      _isfullnameValid = false;
      _isButtonfullnameDisable = false;

      _errorfullnameMessage = "fullname harus lebih dari 4 Huruf";
    } else {
      _isfullnameValid = true;
      _isButtonfullnameDisable = true;
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    _password = value;
    if (_password.isEmpty) {
      _errorPasswordMessage = "Password Tidak Boleh Kosong";
      _isPasswordValid = false;
      _isButtonPasswordDisable = false;
    } else {
      _isPasswordValid = true;
      _isButtonPasswordDisable = true;
    }
    notifyListeners();
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void navigateToDashboard(
    BuildContext context,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
    // saveToken(
    //   valueToken: _fullname,
    // );
  }

  void navigateToRegisterPage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const registration_screen(),
      ),
    );
  }
}
