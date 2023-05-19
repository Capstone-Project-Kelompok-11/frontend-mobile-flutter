import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/buttonWidget.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';

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
                                  hintText: 'Enter your fullname',
                                  textColor:
                                      whiteTextStyle.copyWith(fontSize: 14.4)),
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
                                  hintText: 'Enter your email',
                                  textColor:
                                      whiteTextStyle.copyWith(fontSize: 14)),
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
                                  hintText: 'Enter your password',
                                  textColor:
                                      whiteTextStyle.copyWith(fontSize: 14)),
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
                                  hintText: 'Enter your password',
                                  textColor:
                                      whiteTextStyle.copyWith(fontSize: 14)),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
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
