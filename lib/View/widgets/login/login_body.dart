import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/ViewModels/login_view_model.dart';
import 'package:lms_apps/View/screens/forgot_password.dart';
import 'package:lms_apps/View/screens/register_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/login/buttonWidget.dart';
import 'package:lms_apps/View/widgets/login/login_widget.dart';
import 'package:provider/provider.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
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
                          onChanged: (value) {
                            loginProvider.validateEmail(value);
                          },
                          controller: loginProvider.emailController,
                          title: 'Email',
                          hintText: 'Enter your email',
                          isValidTextField: loginProvider.isEmailValid,
                          errorMessage: loginProvider.errorEmailMessage)
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFormFieldWidget(
                        onChanged: (value) {
                          loginProvider.validatePassword(value);
                        },
                        controller: loginProvider.passwordController,
                        title: 'Password',
                        hintText: '*****',
                        errorMessage: loginProvider.errorPasswordMessage,
                        isValidTextField: loginProvider.isPasswordValid,
                        isObsucreText: loginProvider.isHidePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginProvider.showHidePassword();
                          },
                          icon: loginProvider.isHidePassword
                              ? const Icon(Icons.lock)
                              : const Icon(
                                  Icons.lock_open,
                                ),
                        ),
                      ),
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
              buttonWidget(
                onTap: loginProvider.isButtonEmailValid &&
                        loginProvider.isButtonPasswordValid
                    ? () {
                        loginProvider.login(context);
                        loginProvider.emailController.clear();
                        loginProvider.passwordController.clear();
                        loginProvider.disableButtonLogin();
                      }
                    : null,
                isIcon: true,
                title: 'Sign In',
                textColor: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                color: loginProvider.disableButtonLogin()
                    ? blueColor // Gunakan warna tombol dinonaktifkan saat disableButtonLogin() bernilai true
                    : Colors.grey,
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
}
