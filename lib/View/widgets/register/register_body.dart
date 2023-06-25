// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/login/login_widget.dart';
import 'package:lms_apps/View/widgets/register/buttonWidget.dart';
import 'package:lms_apps/ViewModels/register_view_model.dart';
import 'package:provider/provider.dart';

class registration_screen extends StatefulWidget {
  const registration_screen({super.key});

  @override
  State<registration_screen> createState() => _registration_screenState();
}

class _registration_screenState extends State<registration_screen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        margin: const EdgeInsets.only(top: 121, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Image.asset(
                  'assets/icon/hello.png',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFormFieldWidget(
                                onChanged: (value) {
                                  registerProvider.validatefullname(value);
                                },
                                controller: registerProvider.nameController,
                                errorMessage:
                                    registerProvider.errorfullnameMessage,
                                isValidTextField:
                                    registerProvider.isfullnameValid,
                                hintText: 'Fullname',
                                title: 'Fullname'),
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
                                  registerProvider.validateuserName(value);
                                },
                                controller: registerProvider.userNameController,
                                errorMessage:
                                    registerProvider.erroruserNameMessage,
                                isValidTextField:
                                    registerProvider.isuserNameValid,
                                hintText: 'Username',
                                title: 'Username'),
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
                                  registerProvider.validateEmail(value);
                                },
                                controller: registerProvider.emailController,
                                title: 'Email',
                                hintText: 'Capstone11@gmail.com',
                                errorMessage:
                                    registerProvider.errorEmailMessage,
                                isValidTextField:
                                    registerProvider.isEmailValid),
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
                                registerProvider.validatePassword(value);
                              },
                              controller: registerProvider.passwordController,
                              title: 'Password',
                              hintText: '*****',
                              errorMessage:
                                  registerProvider.errorPasswordMessage,
                              isValidTextField:
                                  registerProvider.isPasswordValid,
                              isObsucreText: registerProvider.isHidePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  registerProvider.showHidePassword();
                                },
                                icon: registerProvider.isHidePassword
                                    ? const Icon(Icons.lock)
                                    : const Icon(
                                        Icons.lock_open,
                                      ),
                              ),
                            ),
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
                                registerProvider.validateConfirmPassword(value);
                              },
                              controller:
                                  registerProvider.confirmPasswordController,
                              title: 'Confirm Password',
                              hintText: '*****',
                              errorMessage:
                                  registerProvider.errorConfirmPasswordMessage,
                              isValidTextField:
                                  registerProvider.isConfirmPasswordValid,
                              isObsucreText:
                                  registerProvider.isHideConfirmPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  registerProvider.showHideConfirmPassword();
                                },
                                icon: registerProvider.isHideConfirmPassword
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                  setState(
                                    () {
                                      _isChecked = !_isChecked;
                                    },
                                  );
                                },
                                child: Text(
                                  'Remember me',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: small),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Terms and Service',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: small),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        buttonWidget(
                            onTap: registerProvider.isfullnameValid &&
                                    registerProvider.isButtonuserNameValid &&
                                    registerProvider.isButtonEmailValid &&
                                    registerProvider.isButtonPasswordValid &&
                                    registerProvider
                                        .isButtonConfirmPasswordValid
                                ? () {
                                    registerProvider.register(
                                        context); // Perbarui RegisterProvider dan reset nilai formulir
                                    registerProvider.nameController.clear();
                                    registerProvider.userNameController.clear();
                                    registerProvider.emailController.clear();
                                    registerProvider.passwordController.clear();
                                    registerProvider.confirmPasswordController
                                        .clear();
                                  }
                                : null,
                            isIcon: true,
                            title: 'Sign Up',
                            textColor: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                            color: blueColor),
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
                                border: Border.all(color: blueColor)),
                            child: Center(
                                child: Text(
                              'Already have an account, Sign In',
                              style: blueTextStyle,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
