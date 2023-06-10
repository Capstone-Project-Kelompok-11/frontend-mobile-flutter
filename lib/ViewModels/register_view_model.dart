// ignore_for_file: avoid_print, prefer_final_fields, use_build_context_synchronously
// import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
// import 'package:lms_apps/Services/constant.dart';
// import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
// import 'package:lms_apps/View/widgets/register/register_body.dart';
import 'package:lms_apps/utils/shared_pref.dart';
import 'package:email_validator/email_validator.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Color activeButtonColor = blueColor; // Warna tombol aktif
  Color disabledButtonColor = Colors.grey; // Warna tombol dinonaktifkan

  // fullname Property
  String _fullname = "";
  String get fullname => _fullname;

  bool _isfullnameValid = true;
  bool get isfullnameValid => _isfullnameValid;

  String _errorfullnameMessage = "";
  String get errorfullnameMessage => _errorfullnameMessage;

  bool _isButtonNameValid = false;
  bool get isButtonNameValid => _isButtonNameValid;

  void validatefullname(String value) {
    _fullname = value;
    if (_fullname.isEmpty) {
      _isfullnameValid = false;
      _isButtonNameValid = false;
      _errorfullnameMessage = "Fullname Tidak Boleh Kosong!";
    }
    // else if (_fullname[0] != _fullname[0].toUpperCase()) {
    //   _isfullnameValid = false;
    //   _isButtonNameValid = false;
    //   _errorfullnameMessage = "Huruf petama harus diawali dengan kapital";
    // }
    else if (_fullname.length < 4) {
      _isfullnameValid = false;
      _isButtonNameValid = false;

      _errorfullnameMessage = "fullname harus lebih dari 4 Huruf";
      // } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_fullname)) {
      //   _isfullnameValid = false;
      //   _isButtonNameValid = false;

      //   _errorfullnameMessage = "fullname harus memiliki angka";
    } else {
      _isButtonNameValid = true;
      _isfullnameValid = true;
    }
    print(_isButtonNameValid);
    notifyListeners();
  }
  // End fullname Property

  // username Property
  String _userName = "";
  String get userName => _userName;

  bool _isuserNameValid = true;
  bool get isuserNameValid => _isuserNameValid;

  String _erroruserNameMessage = "";
  String get erroruserNameMessage => _erroruserNameMessage;

  bool _isButtonuserNameValid = false;
  bool get isButtonuserNameValid => _isButtonuserNameValid;

  void validateuserName(String value) {
    _userName = value;
    if (_userName.isEmpty) {
      _isuserNameValid = false;
      _isButtonuserNameValid = false;
      _erroruserNameMessage = "userName Tidak Boleh Kosong!";
    } else if (_userName.length < 4) {
      _isuserNameValid = false;
      _isButtonNameValid = false;

      _erroruserNameMessage = "userName harus lebih dari 4 Huruf";
    } else {
      _isButtonuserNameValid = true;
      _isuserNameValid = true;
    }
    print(_isButtonuserNameValid);
    notifyListeners();
  }

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
    } else if (!_password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      _errorPasswordMessage = "Password minimal memiliki spesial karakter";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_password)) {
      _errorPasswordMessage = "Password minimal memiliki angka";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else {
      _isButtonPasswordValid = true;
      _isPasswordValid = true;
    }
    print(_isButtonPasswordValid);
    notifyListeners();
  }

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

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  // Button Prorerty
  bool _isButtonEmailDisable = false;
  bool get isButtonEmailDisable => _isButtonEmailDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;
  // End Button

  // Disable Button Prorerty
  bool disableButtonRegister() {
    bool isDisableButton = _isButtonNameValid &&
        _isButtonuserNameValid &&
        _isButtonEmailValid &&
        _isButtonPasswordValid &&
        _isConfirmPasswordValid;
    return isDisableButton;
  }
  //Disable Button

  void saveToken(String token) {
    // Simpan token ke shared preferences
    SharedPref.saveToken(token);
  }

  void navigateToLoginScreen(BuildContext context) {
    // Delay selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      // Navigasi ke layar beranda (HomeScreen) setelah penundaan selesai
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false,
      );
    });
  }

  void showDialogGagal(BuildContext context) {
    // Delay selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      // Navigasi ke layar beranda (HomeScreen) setelah penundaan selesai
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).pop(); // Tutup dialog setelah 2 detik
            },
          );
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: AlertDialog(
              contentPadding: const EdgeInsets.only(right: 39),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              icon: const Icon(
                Icons.check_circle_rounded,
                size: 92.44,
              ),
              title: Text(
                'Unsuccessful Registration',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
            ),
          );
        },
      );
    });
  }

  void showDialogBerhasil(BuildContext context) {
    // Delay selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      // Navigasi ke layar beranda (HomeScreen) setelah penundaan selesai
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).pop(); // Tutup dialog setelah 2 detik
            },
          );
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: AlertDialog(
              contentPadding: const EdgeInsets.only(right: 39),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.white,
              icon: const Icon(
                Icons.check_circle_rounded,
                size: 92.44,
              ),
              title: Text(
                'Successful!',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  void showDialogTidakTerdaftar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gagal Login"),
          content: const Text("Akun tidak terdaftar"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  void showDialogkosong(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gagal Login"),
          content: const Text("Field tidak boleh kosong."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  register(BuildContext context) async {
    print(nameController.text);
    print(userNameController.text);
    print(emailController.text);
    print(passwordController.text);
    try {
      Response response =
          await Dio().post('${APIConstant.url}/users/signup', data: {
        "name": nameController.text,
        "username": userNameController.text,
        "email": emailController.text,
        "password": passwordController.text
      });
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Simpan token ke shared preferences
        showDialogBerhasil(context);
        navigateToLoginScreen(context); // Navigasi ke layar beranda
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        showDialogGagal(context);
        // Tambahkan logika lain yang diperlukan untuk penanganan kode status ini
      }
    } catch (e) {
      if (e is DioError) {
        // Handle DioError
        if (e.response?.statusCode == 400) {
          showDialogkosong(context);
          print('Error from server (400): ${e.response}');
        } else if (e.response?.statusCode == 401) {
          showDialogTidakTerdaftar(context);
          print('Error from server (401): ${e.response}');
        } else {
          // DioError without response
          print('Error from server (no response): ${e.error}');
        }
      } else {
        // Handle other exceptions
        print('Error: $e');
      }
    }
  }
}
