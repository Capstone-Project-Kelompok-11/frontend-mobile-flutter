// ignore_for_file: avoid_print, prefer_final_fields, use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
// import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/register/register_body.dart';
import 'package:lms_apps/utils/shared_pref.dart';
import 'package:email_validator/email_validator.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Button Prorerty
  bool _isButtonEmailDisable = false;
  bool get isButtonEmailDisable => _isButtonEmailDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;
  // End Button

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

  bool disableButtonLogin() {
    bool isDisableButton = isButtonPasswordValid && isButtonEmailValid;

    print("halo $isDisableButton");
    return isDisableButton;
  }

  void saveToken(String token) {
    // Simpan token ke shared preferences
    SharedPref.saveToken(token);
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

  login(BuildContext context) async {
    print(emailController.text);
    print(passwordController.text);

    Dio dio = Dio();

    try {
      Response response = await dio.post('${APIConstant.url}/users/login',
          data: FormData.fromMap({
            "username": "*",
            "email": emailController.text,
            "password": passwordController.text
          }));
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data["data"]['token']);
        saveToken(response.data['data']
            ['token']); // Simpan token ke shared preferences
        navigateToHomeScreen(context); // Navigasi ke layar beranda
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

  void navigateToHomeScreen(BuildContext context) {
    // Navigasi ke layar beranda  (HomeScreen)
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
        (route) => false);
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
