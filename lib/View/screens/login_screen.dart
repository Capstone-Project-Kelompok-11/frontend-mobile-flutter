

// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/forgotPassword_screen.dart';
import 'package:lms_apps/View/screens/provider/login_provider.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'package:provider/provider.dart';
import 'widget/buttonWidget.dart';


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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 121, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                          Text(
                            'Email',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: small),
                          ),
                          textFieldWidget(
                            hintText: 'Enter your email',
                            onChanged: (value) {
                              loginProvider.validatefullname(value);
                            },
                            isValidTextField: loginProvider.isfullnameValid,
                            errorMessage: loginProvider.errorfullnameMessage,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: small),
                          ),
                          textFieldWidget(
                            onChanged: (value) {
                              loginProvider.validatePassword(value);
                            },
                            isObsucreText: loginProvider.isHidePassword,
                            isValidTextField: loginProvider.isPasswordValid,
                            errorMessage: loginProvider.errorPasswordMessage,
                            hintText: 'Password',
                            suffixIconWidget: IconButton(
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
                        builder: (context) => const forgotPassword(),
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
                    onTap: loginProvider.isButtonfullnameDisable &&
                            loginProvider.isButtonPasswordDisable
                        ? () {
                            loginProvider.navigateToDashboard(context);
                          }
                        : null,
                    isIcon: true,
                    title: 'Sign In',
                    textColor: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    color: blueColor,
                  ),
                  buttonWidget(
                    onTap: () {
                      loginProvider.navigateToRegisterPage(context);
                    },
                    title: "Didn't have an account? Sign Up",
                    textColor: blueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    color: whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
