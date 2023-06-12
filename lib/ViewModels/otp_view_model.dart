// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screen/dashboard_screen.dart';
// import 'package:flutter_application_2/screen/register_with_provider_page.dart';
// import 'package:flutter_application_2/utils/shared_pref.dart';

class OTPProvider with ChangeNotifier {
  TextEditingController otpController = TextEditingController();
 // otp provider
  String _OTP = "";
  String get OTP => _OTP;

  bool _isOTPValid = true;
  bool get isOTPValid => _isOTPValid;

  String _errorOTPMessage = "";
  String get errorOTPMessage => _errorOTPMessage;

  bool _isHideOTP = true;
  bool get isHideOTP => _isHideOTP;

  bool _isButtonOTPValid = false;
  bool get isButtonOTPValid => _isButtonOTPValid;

  void validateOTP(String value) {
    _OTP = value;
    if (_OTP.isEmpty) {
      _errorOTPMessage = "Code OTP Tidak Boleh Kosong";
      _isOTPValid = false;
      _isButtonOTPValid = false;
    } else {
      int? otpValue = int.tryParse(_OTP);
      if (otpValue == null) {
        _errorOTPMessage = "Code OTP Harus Berupa Angka";
        _isOTPValid = false;
        _isButtonOTPValid = false;
      } else if (_OTP.length > 4) {
        _errorOTPMessage = "Code OTP tidak lebih dari 4";
        _isOTPValid = false;
        _isButtonOTPValid = false;
      } else {
        _isButtonOTPValid = true;
        _isOTPValid = true;
      }
    }
    print(_isButtonOTPValid);
    notifyListeners();
  }

  void showHideOTP() {
    _isHideOTP = !_isHideOTP;
    notifyListeners();
  }
}
