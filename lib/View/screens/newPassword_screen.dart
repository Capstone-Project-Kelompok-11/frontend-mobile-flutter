// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/otp_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';

// ignore: camel_case_types
class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

// ignore: camel_case_types
class _newPasswordState extends State<newPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
          child: Column(children: [
            Text(
              'Create new Password',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Save the new password in a safe place, If you forget it then you have to do a forgot paswword again',
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
                    'Create a new password',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  textFieldWidget(
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.emailAddress,
                    isObsucreText: false,
                    textColor: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: small),
                  ),
                  Text(
                    'Confirm a new password',
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
              height: 167,
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
