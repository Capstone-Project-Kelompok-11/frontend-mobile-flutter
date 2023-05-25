// ignore_for_file: prefer_final_fields

// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  // Username Property
  String _username = "";
  String get username => _username;

  bool _isUsernameValid = true;
  bool get isUsernameValid => _isUsernameValid;

  String _errorUsernameMessage = "";
  String get errorUsernameMessage => _errorUsernameMessage;

  bool _isButtonNameValid = false;
  bool get isButtonNameValid => _isButtonNameValid;

  void validateUsername(String value) {
    _username = value;
    if (_username.isEmpty) {
      _isUsernameValid = false;
      _isButtonNameValid = false;
      _errorUsernameMessage = "Username Tidak Boleh Kosong!";
    } else if (_username[0] != _username[0].toUpperCase()) {
      _isUsernameValid = false;
      _isButtonNameValid = false;

      _errorUsernameMessage = "Huruf petama harus diawali dengan kapital";
    } else if (_username.length < 4) {
      _isUsernameValid = false;
      _isButtonNameValid = false;

      _errorUsernameMessage = "Username harus lebih dari 4 Huruf";
    } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_username)) {
      _isUsernameValid = false;
      _isButtonNameValid = false;

      _errorUsernameMessage = "Username harus memiliki angka";
    } else {
      _isButtonNameValid = true;
      _isUsernameValid = true;
    }
    print(_isButtonNameValid);
    notifyListeners();
  }

  // End Username Property

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
    } else if (_password != _confirmPassword) {
      _errorPasswordMessage = "Password tidak cocok";
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

  // Telepon Property
  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  bool _isPhoneNumberValid = true;
  bool get isPhoneNumberValid => _isPhoneNumberValid;

  String _errorPhoneNumberMessage = "";
  String get errorPhoneNumberMessage => _errorPhoneNumberMessage;

  bool _isButtonPhoneNumberValid = false;
  bool get isButtonPhoneNumberValid => _isButtonPhoneNumberValid;

  // void validatePhoneNumber(PhoneNumber phoneNumber) {
  //   _phoneNumber = phoneNumber.number;
  //   if (_phoneNumber.isEmpty) {
  //     _errorPhoneNumberMessage = 'Phone Number Tidak Boleh Kosong';
  //     _isPhoneNumberValid = false;
  //     _isButtonPhoneNumberValid = false;
  //   } else if (_phoneNumber.length < 4) {
  //     _errorPhoneNumberMessage = 'Nomor Telepon harus lebih dari 4 angka';
  //     _isPhoneNumberValid = false;
  //     _isButtonPhoneNumberValid = false;
  //   } else {
  //     _isPhoneNumberValid = true;
  //     _isButtonPhoneNumberValid = true;
  //   }
  //   print(_isButtonPhoneNumberValid);
  //   notifyListeners();
  // }

  // End Telepon Property

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

  bool disableButtonRegister() {
    bool isDisableButton = isButtonNameValid &&
        isButtonPasswordValid &&
        isButtonConfirmPasswordValid &&
        isButtonPhoneNumberValid &&
        isButtonEmailValid;

    print("halo $isDisableButton");

    return isDisableButton;
  }
}
