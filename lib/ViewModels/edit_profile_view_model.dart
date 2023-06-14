import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/edit_profile_service.dart';

class EditProfileViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // FULLNAME PROPERTY
  String _fullname = "";
  String get fullname => _fullname;

  bool _isFullnameValid = true;
  bool get isFullnameValid => _isFullnameValid;

  String _errorFullnameMessage = "";
  String get errorFullnameMessage => _errorFullnameMessage;

  bool _isButtonFullnameValid = false;
  bool get isButtonFullnameValid => _isButtonFullnameValid;

  void validateFullname(String value) {
    _fullname = value;
    if (_fullname.isEmpty) {
      _isFullnameValid = false;
      _isButtonFullnameValid = false;
      _errorFullnameMessage = "Fullname Tidak Boleh Kosong!";
    } else if (_fullname.length < 4) {
      _isFullnameValid = false;
      _isButtonFullnameValid = false;
      _errorFullnameMessage = "Fullname harus lebih dari 4 Huruf";
    } else {
      _isButtonFullnameValid = true;
      _isFullnameValid = true;
    }
    notifyListeners();
  }
  // END OF FULLNAME PROPERTY

  // PHONE NUMBER PROPERTY
  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  bool _isPhoneNumberValid = true;
  bool get isPhoneNumberValid => _isPhoneNumberValid;

  String _errorPhoneNumberMessage = "";
  String get errorPhoneNumberMessage => _errorPhoneNumberMessage;

  bool _isButtonPhoneNumberValid = false;
  bool get isButtonPhoneNumberValid => _isButtonPhoneNumberValid;

  void validatePhoneNumber(String value) {
    _phoneNumber = value;
    if (_phoneNumber.isEmpty) {
      _isPhoneNumberValid = false;
      _isButtonPhoneNumberValid = false;
      _errorPhoneNumberMessage = "Nomor Handphone Tidak Boleh Kosong!";
    } else if (_phoneNumber.length < 4) {
      _isPhoneNumberValid = false;
      _isButtonPhoneNumberValid = false;
      _errorPhoneNumberMessage = "Nomor Handphone harus lebih dari 4 Digit";
    } else {
      _isButtonPhoneNumberValid = true;
      _isPhoneNumberValid = true;
    }
    notifyListeners();
  }
  // END OF PHONE NUMBER PROPERTY

  // CONFIRM PASSWORD PROPERTY
  String _confirmPassword = "";
  String get confirmPassword => _confirmPassword;

  bool _isConfirmPasswordValid = true;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid;

  String _errorConfirmPasswordMessage = "";
  String get errorConfirmPasswordMessage => _errorConfirmPasswordMessage;

  bool _isButtonConfirmPasswordValid = false;
  bool get isButtonConfirmPasswordValid => _isButtonConfirmPasswordValid;

  void validateConfirmPassword(String value) {
    _confirmPassword = value;
    if (_confirmPassword.isEmpty) {
      _isConfirmPasswordValid = false;
      _isButtonConfirmPasswordValid = false;
      _errorConfirmPasswordMessage = "Confirm Password Tidak Boleh Kosong!";
    } else {
      _isButtonConfirmPasswordValid = true;
      _isConfirmPasswordValid = true;
    }
    notifyListeners();
  }
  // END OF CONFIRM PASSWORD PROPERTY

  // Disable Button Prorerty
  bool disableButtonSave() {
    bool isDisableButton = confirmPasswordController.text.isEmpty;

    return isDisableButton;
  }
  //Disable Button

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
    final result = await EditProfileService().changeUserInfo(
      name: nameController.text,
      phone: phoneController.text,
      password: confirmPasswordController.text,
    );
    result.data;
    notifyListeners();
  }

  cekPerkondisian(BuildContext context) async {
    if (nameController.text.isEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      updatePhoneNumber();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Update Nomor Handphone Berhasil!'),
        ),
      );
    } else if (phoneController.text.isEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      updateFullname();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Update Fullname Berhasil!'),
        ),
      );
    } else if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      getNewChangeUserInfo();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Update Profile Berhasil!'),
        ),
      );
    } else {}
    notifyListeners();
  }

  updateFullname() async {
    final result = await EditProfileService().changeUserInfo(
      name: nameController.text,
      phone: phone,
      password: confirmPasswordController.text,
    );
    result.data;
    notifyListeners();
  }

  updatePhoneNumber() async {
    final result = await EditProfileService().changeUserInfo(
      name: name,
      phone: phoneController.text,
      password: confirmPasswordController.text,
    );
    result.data;
    notifyListeners();
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
          _imagePath = "${result.data?.image}";
        } else {
          _imagePath = '';
        }

        nameController.text = '';
        phoneController.text = '';
        confirmPasswordController.text = '';

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
