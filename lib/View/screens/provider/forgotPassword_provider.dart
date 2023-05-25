// ignore_for_file: prefer_final_fields

// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/otp_screen.dart';

class ForgotPasswordProvider with ChangeNotifier {
  // Email Property
  String _email = "";
  String get email => _email;

  bool _isEmailValid = true;
  bool get isEmailValid => _isEmailValid;

  String _errorEmailMessage = "";
  String get errorEmailMessage => _errorEmailMessage;

  bool _isButtonEmailValid = false;
  bool get isButtonEmailValid => _isButtonEmailValid;

  void validateEmail(String value) {
    _email = value;
    if (_email.isEmpty) {
      _errorEmailMessage = "Email Tidak Boleh Kosong";
      _isEmailValid = false;
    } else if (!EmailValidator.validate(_email)) {
      _errorEmailMessage = "Email Tidak Sesuai";
      _isEmailValid = false;
      _isButtonEmailValid = false;
    } else {
      _isEmailValid = true;
      _isButtonEmailValid = true;
    }
    print(_isButtonEmailValid);

    notifyListeners();
  }
  // End Email

  bool disableButtonForgotPassword() {
    bool isDisableButton = isButtonEmailValid;

    return isDisableButton;
  }

  void navigateToOTPPage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OTPscreen(),
      ),
    );
  }
}
