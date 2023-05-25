import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/register_screen.dart';
// import 'package:flutter_application_2/screen/dashboard_screen.dart';
// import 'package:flutter_application_2/screen/register_with_provider_page.dart';
// import 'package:flutter_application_2/utils/shared_pref.dart';

class LoginProvider with ChangeNotifier {
  // Username Property
  String _username = "";
  String get username => _username;

  bool _isUsernameValid = true;
  bool get isUsernameValid => _isUsernameValid;

  String _errorUsernameMessage = "";
  String get errorUsernameMessage => _errorUsernameMessage;

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
  bool _isButtonUsernameDisable = false;
  bool get isButtonUsernameDisable => _isButtonUsernameDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;

  void validateUsername(String value) {
    _username = value;
    if (_username.isEmpty) {
      _isUsernameValid = false;
      _isButtonUsernameDisable = false;

      _errorUsernameMessage = "Username Tidak Boleh Kosong!";
    } else if (_username.length < 4) {
      _isUsernameValid = false;
      _isButtonUsernameDisable = false;

      _errorUsernameMessage = "Username harus lebih dari 4 Huruf";
    } else {
      _isUsernameValid = true;
      _isButtonUsernameDisable = true;
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
    //   valueToken: _username,
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
