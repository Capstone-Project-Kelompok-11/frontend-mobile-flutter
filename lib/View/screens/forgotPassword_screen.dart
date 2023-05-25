import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
// import 'package:lms_apps/View/screens/otp_screen.dart';
import 'package:lms_apps/View/screens/provider/forgotPassword_provider.dart';
// import 'package:lms_apps/View/screens/provider/register_provider.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';
import 'package:provider/provider.dart';

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
    ForgotPasswordProvider forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context);
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
                    onChanged: (value) {
                      forgotPasswordProvider.validateEmail(value);
                    },
                    isValidTextField: forgotPasswordProvider.isEmailValid,
                    errorMessage: forgotPasswordProvider.errorEmailMessage,
                    hintText: 'Email',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 251,
            ),
            buttonWidget(
                onTap: forgotPasswordProvider.isButtonEmailValid
                    ? () {
                        forgotPasswordProvider.navigateToOTPPage(context);
                      }
                    : null,
                isIcon: true,
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
