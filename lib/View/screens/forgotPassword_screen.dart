// ignore: file_names

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/otp_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';

// ignore: camel_case_types
class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

// ignore: camel_case_types
class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
          child: Column(children: [
            Text(
              'Forgot Password',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Enter your Email, address to get an OTP code to reset you password.',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  textFieldWidget(
                      hintText: 'Enter your password',
                      keyboardType: TextInputType.emailAddress,
                      isObsucreText: false,
                      textColor: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: small)),
                ],
              ),
            ),
            const SizedBox(
              height: 251,
            ),
            buttonWidget(
                                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPscreen(),
                        ),
                      );
                    },
                title: 'Continue',
                color: blueColor,
                textColor:
                    whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular))
          ]),
        ),
      ),
    );
  }
}
