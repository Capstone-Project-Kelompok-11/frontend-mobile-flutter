// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/newPassword_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
// import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
// import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';

// ignore: camel_case_types
class OTPscreen extends StatefulWidget {
  const OTPscreen({super.key});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

// ignore: camel_case_types
class _OTPscreenState extends State<OTPscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
          child: Column(children: [
            Text(
              "You've got mail",
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'We have sent the OTP verification code to your email address, Check your email and enter the code below.',
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
                    'Code OTP',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  // textFieldWidget(
                  //           onChanged: (value) {
                  //             loginProvider.validatePassword(value);
                  //           },
                  //           isObsucreText: loginProvider.isHidePassword,
                  //           isValidTextField: loginProvider.isPasswordValid,
                  //           errorMessage: loginProvider.errorPasswordMessage,
                  //           hintText: 'Password',
                  //           suffixIconWidget: IconButton(
                  //             onPressed: () {
                  //               loginProvider.showHidePassword();
                  //             },
                  //             icon: loginProvider.isHidePassword
                  //                 ? const Icon(Icons.lock)
                  //                 : const Icon(
                  //                     Icons.lock_open,
                  //                   ),
                  //           ),
                  //         ),
                ],
              ),
            ),
            Text(
              "Didn't receive email?",
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
            ),
            Text(
              "You can resend code in 60 s",
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
            ),
            const SizedBox(
              height: 27,
            ),
            buttonWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const newPassword(),
                    ),
                  );
                },
                title: 'Confirm',
                color: blueColor,
                textColor:
                    whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular))
          ]),
        ),
      ),
    );
  }
}
