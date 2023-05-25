import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/provider/register_provider.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/buttonWidget.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class registration_screen extends StatefulWidget {
  const registration_screen({super.key});

  @override
  State<registration_screen> createState() => _registration_screenState();
}

// ignore: camel_case_types
class _registration_screenState extends State<registration_screen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fullname',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: small),
                              ),
                              textFieldWidget(
                                hintText: 'Username',
                                onChanged: (value) {
                                  registerProvider.validateUsername(value);
                                },
                                isValidTextField:
                                    registerProvider.isUsernameValid,
                                errorMessage:
                                    registerProvider.errorUsernameMessage,
                              ),
                            ],
                          ),
                        ),
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
                                onChanged: (value) {
                                  registerProvider.validateEmail(value);
                                },
                                isValidTextField: registerProvider.isEmailValid,
                                errorMessage:
                                    registerProvider.errorEmailMessage,
                                hintText: 'Email',
                              ),
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
                                  registerProvider.validatePassword(value);
                                },
                                isObsucreText: registerProvider.isHidePassword,
                                isValidTextField:
                                    registerProvider.isPasswordValid,
                                errorMessage:
                                    registerProvider.errorPasswordMessage,
                                hintText: 'Password',
                                suffixIconWidget: IconButton(
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
                              Text(
                                'Confirm Password',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: small),
                              ),
                              textFieldWidget(
                                onChanged: (value) {
                                  registerProvider
                                      .validateConfirmPassword(value);
                                },
                                isObsucreText:
                                    registerProvider.isHideConfirmPassword,
                                isValidTextField:
                                    registerProvider.isConfirmPasswordValid,
                                errorMessage: registerProvider
                                    .errorConfirmPasswordMessage,
                                hintText: 'Confirm Password',
                                suffixIconWidget: IconButton(
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
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                    child: Text(
                                      'Remember me',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12, fontWeight: small),
                                    )),
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
                    const SizedBox(height: 100),
                    Column(
                      children: [
                        buttonWidget(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9),
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
                                        'Succesful!',
                                        textAlign: TextAlign.center,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 18, fontWeight: bold),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            title: 'Sign Up',
                            textColor: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular),
                            color: blueColor),
                        buttonWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const login_screen(),
                                ),
                              );
                            },
                            title: 'Already have an account, Sign In',
                            textColor: blueTextStyle.copyWith(
                                fontSize: 14, fontWeight: regular),
                            color: whiteColor),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
