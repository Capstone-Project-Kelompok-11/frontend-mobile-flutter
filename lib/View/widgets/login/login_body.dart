import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/forgot_password.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
// import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/register_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  void saveToken(String token) {
    // Simpan token ke shared preferences
    SharedPref.saveToken(token);
  }

  void navigateToHomeScreen(BuildContext context) {
    // Navigasi ke layar beranda (HomeScreen)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  login() async {
    print(emailController.text);
    print(passwordController.text);

    Dio dio = Dio();

    try {
      Response response = await dio.post('$url/users/login',
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
      }
    } catch (e) {
      print('Error from server : $e');
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 121, left: 30, right: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Hello there',
                style: GoogleFonts.poppins(
                  fontSize: 24.88,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              Image.asset(
                'assets/icon/hello.png',
                width: 32.08,
                height: 32.08,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFormFieldWidget(
                        controller: emailController,
                        title: 'Email',
                        hintText: 'Enter your email',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFormFieldWidget(
                          controller: passwordController,
                          title: 'Password',
                          hintText: '*****',
                          suffixIcon: const Icon(Icons.lock)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                          child: Text('Remember me', style: blackTextStyle),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 56),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                );
              },
              child: Text('Forgot Password',
                  style: blackTextStyle.copyWith(
                      fontSize: 17.27, fontWeight: bold)),
            ),
          ),
          const SizedBox(height: 150),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    login();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: whiteTextStyle,
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blueColor)),
                  child: Center(
                      child: Text(
                    "Didn't have an account? Sign Up",
                    style: blueTextStyle,
                  )),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget textFormFieldWidget({
    required String title,
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.only(left: 16),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  // void saveToken(String token) {
  //   // Simpan token ke shared preferences
  //   SharedPref.saveToken(token);
  // }

  // void navigateToDashboard(BuildContext context) {
  //   // Navigasi ke layar beranda (HomeScreen)
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => const HomeScreen(),
  //     ),
  //   );
  // }

  // login() async {
  //   print(emailController.text);
  //   print(passwordController.text);

  //   Dio dio = Dio();

  //   try {
  //     Response response = await dio.post('$url/users/login',
  //         data: FormData.fromMap({
  //           "username": "*",
  //           "email": emailController.text,
  //           "password": passwordController.text
  //         }));
  //     print(response);

  //     if (response.statusCode == 200) {
  //       print(response.data['token']);
  //       saveToken(response.data['token']); // Simpan token ke shared preferences
  //       navigateToDashboard(context); // Navigasi ke layar beranda
  //     }
  //   } catch (e) {
  //     print('Error from server : $e');
  //   }
  // }
}
