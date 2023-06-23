// ignore_for_file: prefer_final_fields, avoid_print, use_build_context_synchronously

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

import '../Services/constant.dart';
// import 'package:lms_apps/View/screens/otp_screen.dart';

class ForgotPasswordProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
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

  // bool disableButtonForgotPassword() {
  //   bool isDisableButton = isButtonEmailValid;

  //   print("halo $isDisableButton");
  //   return isDisableButton;
  // }

  bool disableButtonForgotPassword() {
    bool isDisableButton = isButtonEmailValid;

    print("halo $isDisableButton");
    return isDisableButton;
  }

  bool disableButtonNewPassword() {
    bool isDisableButton = isButtonPasswordValid;

    print("halo $isDisableButton");
    return isDisableButton;
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

  void showDialogBerhasil(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.white,
            icon: const Icon(
              Icons.check_circle_rounded,
              size: 92.44,
            ),
            title: Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            ),
            content: Text(
              'You have succesfully reset and created a new password',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    "Back to Login",
                    style: whiteTextStyle,
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
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

  newPass(BuildContext context) async {
    print(emailController.text);
    print(passwordController.text);

    Dio dio = Dio();

    try {
      Response response = await dio.post(
          '${APIConstant.url}/users/forgot/password',
          data: FormData.fromMap({
            "email": emailController.text,
            "password": passwordController.text
          }));
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data["data"]['token']);
        showDialogBerhasil(context); // Navigasi ke layar beranda
      } else if (response.statusCode == 401) {
        showDialogTidakTerdaftar(context);
      } else if (response.statusCode == 400) {
        showDialogkosong(context);
      }
      // else {
      //   print('Error from server : ');
      // }
      notifyListeners();
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

  // void navigateToOTPPage(
  //   BuildContext context,
  // ) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => const OTPscreen(),
  //     ),
  //   );
  // }
}
